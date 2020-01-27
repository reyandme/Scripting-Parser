unit Main;
interface
uses
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, SysUtils,
  Classes, StdCtrls, StrUtils, Types, INIFiles;

type
  TKMCharArray = TArray<Char>;

  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txtParserOutput: TMemo;
    edtActionsFile: TEdit;
    edtEventsFile: TEdit;
    edtStatesFile: TEdit;
    edtOutputFileActions: TEdit;
    edtOutputFileEvents: TEdit;
    edtOutputFileStates: TEdit;
    btnGenerateWiki: TButton;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    edtOutputFileUtils: TEdit;
    edtUtilsFile: TEdit;
    Label8: TLabel;
    btnGenerateXML: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGenerateWikiClick(Sender: TObject);
    procedure txtParserOutputKeyPress(Sender: TObject; var Key: Char);
    procedure edtOnTextChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnGenerateXMLClick(Sender: TObject);
  private
    fSettingsPath: string;
    fUpdating: Boolean;
    procedure ParseText(aFile: string; aList: TStringList; aHasReturn: Boolean);
    function ParseParams(aString: string; aDescriptions: TStringList): string;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure GenerateWiki;
    procedure GenerateXML;
  end;

  TParamHolder = record
    Name, varType: string;
  end;

  TCommandInfo = record
    Version: string;
    Name: string;
    Description: string;
    Parameters: string;
    Return: string;
    ReturnDesc: string;
  end;

const
  VAR_TYPE_NAME: array[0..34] of string = (
    'Byte', 'Shortint', 'Smallint', 'Word', 'Integer', 'Cardinal', 'Single', 'Extended', 'Boolean', 'AnsiString', 'String',
    'array of const', 'array of String', 'array of AnsiString', 'array of Integer', 'array of Single', 'array of Extended',
    'TKMHouseType', 'TKMWareType', 'TKMFieldType', 'TKMUnitType',
    'THouseType', 'TWareType', 'TFieldType', 'TUnitType',
    'TKMObjectiveStatus', 'TKMObjectiveType',
    'TKMHouseFace',
    'TKMHouse', 'TKMUnit', 'TKMUnitGroup', 'TKMHandIndex', 'array of TKMHandIndex', // Werewolf types
    'TByteSet', 'TIntegerArray' // Werewolf types
  );

  VAR_TYPE_ALIAS: array[0..34] of string = (
    'Byte', 'Shortint', 'Smallint', 'Word', 'Integer', 'Cardinal', 'Single', 'Extended', 'Boolean', 'AnsiString', 'String',
    'array of const', 'array of String', 'array of AnsiString', 'array of Integer', 'array of Single', 'array of Extended',
    'TKMHouseType', 'TKMWareType', 'TKMFieldType', 'TKMUnitType',
    'THouseType', 'TWareType', 'TFieldType', 'TUnitType',
    'TKMObjectiveStatus', 'TKMObjectiveType',
    'TKMHouseFace',
    'Integer', 'Integer', 'Integer', 'Integer', 'array of Integer', // Werewolf types
    'set of Byte', 'array of Integer' // Werewolf types
  );

var
  Form1: TForm1;

  //String functions
  function StrIndexOf(aStr, aSubStr: String): Integer;
  function StrLastIndexOf(aStr, aSubStr: String): Integer;
  function StrSubstring(aStr: String; aFrom, aLength: Integer): String; overload;
  function StrSubstring(aStr: String; aFrom: Integer): String; overload;
  function StrContains(aStr, aSubStr: String): Boolean;
  function StrTrimRight(aStr: String; aCharsToTrim: TKMCharArray): String;
  function StrSplit(aStr, aDelimiters: String): TStrings;

implementation
{$R *.dfm}


{String functions
These function are replacements for String functions introduced after XE2 (XE5 probably)
Names are the same as in new Delphi versions, but with 'Str' prefix
}
function StrIndexOf(aStr, aSubStr: String): Integer;
begin
  //Todo refactor:
  //@Krom: Why not just replace StrIndexOf with Pos everywhere in code?
  Result := AnsiPos(aSubStr, aStr) - 1;
end;


function StrLastIndexOf(aStr, aSubStr: String): Integer;
var I: Integer;
begin
  Result := -1;
  for I := 1 to Length(aStr) do
    if StartsStr(aSubStr, StrSubstring(aStr, I-1)) then
      Result := I - 1;
end;


function StrSubstring(aStr: String; aFrom: Integer): String;
begin
  //Todo refactor:
  //@Krom: Why not just replace StrSubstring with RightStr everywhere in code?
  Result := Copy(aStr, aFrom + 1, Length(aStr));
end;


function StrSubstring(aStr: String; aFrom, aLength: Integer): String;
begin
  //Todo refactor:
  //@Krom: Why not just replace StrSubstring with Copy everywhere in code?
  Result := Copy(aStr, aFrom + 1, aLength);
end;


function StrContains(aStr, aSubStr: String): Boolean;
begin
  //Todo refactor:
  //@Krom: Why not just replace StrContains with Pos() <> 0 everywhere in code?
  Result := StrIndexOf(aStr, aSubStr) <> -1;
end;


function StrTrimRight(aStr: String; aCharsToTrim: TKMCharArray): String;
var Found: Boolean;
    I, J: Integer;
begin
  for I := Length(aStr) downto 1 do
  begin
    Found := False;
    for J := Low(aCharsToTrim) to High(aCharsToTrim) do
    begin
      if aStr[I] = aCharsToTrim[J] then
      begin
        Found := True;
        Break;
      end;
    end;
    if not Found then
      Break;
  end;
  Result := Copy(aStr, 1, I);
end;


function StrSplit(aStr, aDelimiters: String): TStrings;
var StrArray: TStringDynArray;
    I: Integer;
begin
  //Todo refactor:
  //@Krom: It's bad practice to create object (TStringList) inside and return it as parent class (TStrings).
  //Do we really need it this way? Better to pass TStringList from outside in a parameter.

  StrArray := SplitString(aStr, aDelimiters);
  Result := TStringList.Create;
  for I := Low(StrArray) to High(StrArray) do
    Result.Add(StrArray[I]);
end;


{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.Click;
end;


procedure TForm1.LoadSettings;
var
  ini: TINIFile;
begin
  ini := TINIFile.Create(fSettingsPath);

  fUpdating := True;

  edtActionsFile.Text       := ini.ReadString('INPUT',  'Actions', '..\..\src\scripting\KM_ScriptingActions.pas');
  edtEventsFile.Text        := ini.ReadString('INPUT',  'Events',  '..\..\src\scripting\KM_ScriptingEvents.pas');
  edtStatesFile.Text        := ini.ReadString('INPUT',  'States',  '..\..\src\scripting\KM_ScriptingStates.pas');
  edtUtilsFile.Text         := ini.ReadString('INPUT',  'Utils',   '..\..\src\scripting\KM_ScriptingUtils.pas');
  edtOutputFileActions.Text := ini.ReadString('OUTPUT', 'Actions', 'Actions.wiki');
  edtOutputFileEvents.Text  := ini.ReadString('OUTPUT', 'Events',  'Events.wiki');
  edtOutputFileStates.Text  := ini.ReadString('OUTPUT', 'States',  'States.wiki');
  edtOutputFileUtils.Text   := ini.ReadString('OUTPUT', 'Utils',   'Utils.wiki');
  FreeAndNil(ini);

  fUpdating := False;

  if not FileExists(fSettingsPath) then
    SaveSettings;
end;


{
  Parses the param string into prefered wiki-format.
  Results:
  1 - [name]: [type];
  2 - etc
}
function TForm1.ParseParams(aString: string; aDescriptions: TStringList): string;
var
  i, j, K, nextType: Integer;
  isParam: Boolean;
  listTokens, paramList, typeList: TStringList;
  paramHolder: array of TParamHolder;
  lastType: string;
  charArr: TKMCharArray;
begin
  if aString = 'aPlayer: ShortInt; const aFileName: AnsiString; aVolume: Single' then
    Sleep(0);

  Result := '';

  listTokens := TStringList.Create;
  paramList := TStringList.Create;
  typeList  := TStringList.Create;
  try
    // If not set to -1 it skips the first variable
    nextType := -1;

    listTokens.AddStrings(StrSplit(aString, ' '));

    // Re-combine type arrays
    for i := 0 to listTokens.Count - 1 do
    begin
      SetLength(charArr, 3);
      charArr[0] := ',';
      charArr[1] := ':';
      charArr[2] := ';';
      listTokens[i] := StrTrimRight(listTokens[i], charArr);

      if SameText(listTokens[i], 'array') then
      begin
        nextType := i + 2;
        // For some reason this kept giving 'array of Integer;' hence the trim
        paramList.Add(StrTrimRight(listTokens[i] + ' ' + listTokens[nextType - 1] + ' ' + listTokens[nextType], charArr));
      end else
        // Skip unused stuff
        if not ((SameText(listTokens[i], 'of')) or (SameText(listTokens[i], 'const')) or (i = nextType)) then
          paramList.Add(listTokens[i]);
    end;

    // Bind variable names to their type
    // Use reverse scan, so that we can remember last met type and apply it to all preceeding parameters
    lastType := '';
    for i := paramList.Count - 1 downto 0 do
    begin
      // See if this token is a Type
      isParam := True;
      for K := 0 to High(VAR_TYPE_NAME) do
        if SameText(VAR_TYPE_NAME[K], paramList[i]) then
        begin
          lastType := VAR_TYPE_ALIAS[K];
          isParam := False;
          Break;
        end;

      if isParam then
      begin
        SetLength(paramHolder, Length(paramHolder) + 1);
        paramHolder[High(paramHolder)].Name := paramList[i];
        paramHolder[High(paramHolder)].varType := lastType;
      end;
    end;

    // Add line-breaks
    for i := High(paramHolder) downto 0 do
    begin
      Result := Result + paramHolder[i].Name + ': ' + paramHolder[i].varType + ';';

      // Add micro descriptions to the parameters and remove them from the stringlist.
      for j := aDescriptions.Count - 1 downto 0 do
        if StartsStr(paramHolder[i].Name, aDescriptions[j]) then
        begin
          Result := Result + ' // ' + StrSubstring(aDescriptions[j], StrIndexOf(aDescriptions[j], ':') + 2);
          aDescriptions.Delete(j);
          Break;
        end;

      if i <> 0 then
        Result := Result + ' <br> ';
    end;
  finally
    FreeAndNil(listTokens);
    FreeAndNil(paramList);
    FreeAndNil(typeList);
  end;
end;


// Scans file's contents and puts it all in proper formatting for most wikis.
procedure TForm1.ParseText(aFile: string; aList: TStringList; aHasReturn: Boolean);
var
  i, j, iPlus: Integer;
  restStr: string;
  sourceTxt, descrTxt: TStringList;
  res: TCommandInfo;
  charArr: TKMCharArray;
begin
  sourceTxt := TStringList.Create;
  descrTxt  := TStringList.Create;
  try
    sourceTxt.LoadFromFile(aFile);

    for i := 0 to SourceTxt.Count - 1 do
    begin
      // Reset old values
      res := default(TCommandInfo);
      iPlus := 0;
      descrTxt.Clear;

      //* Version: 1234
      //* Large description of the method, optional
      //* aX: Small optional description of parameter
      //* aY: Small optional description of parameter
      //* Result: Small optional description of returned value

      // Before anything it should start with "//* Version:"
      if StartsStr('//* Version:', sourceTxt[i]) then
      begin
        restStr := Trim(StrSubstring(sourceTxt[i], StrIndexOf(sourceTxt[i], ':') + 2));
        res.Version := IfThen(restStr = '', '-', restStr);
        Inc(iPlus);

        // Descriptions are only added by lines starting with "//* "
        if StartsStr('//* ', sourceTxt[i+iPlus]) then
          // Repeat until no description tags are found
          while StartsStr('//* ', sourceTxt[i+iPlus]) do
          begin
            // Handle Result description separately to keep the output clean.
            if StartsStr('//* Result:', sourceTxt[i+iPlus]) then
              res.ReturnDesc := StrSubstring(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], ':') + 2)
            else
              descrTxt.Add(StrSubstring(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '*') + 2));
            Inc(iPlus);
          end;

        // Skip empty or "faulty" lines
        while
          not StartsStr('procedure', sourceTxt[i+iPlus])
          and not StartsStr('function', sourceTxt[i+iPlus]) do
          Inc(iPlus);

        // Format procedures
        if StartsStr('procedure', sourceTxt[i+iPlus]) then
        begin
          if StrContains(sourceTxt[i+iPlus], '(') then
          begin
            restStr := Copy(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '.') + 2,
                            StrIndexOf(sourceTxt[i+iPlus], '(') - (StrIndexOf(sourceTxt[i+iPlus], '.') + 1));
            res.Name := ReplaceStr(restStr, 'Proc', 'On');
            res.Parameters := ParseParams(Copy(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '(') + 2,
                                                                   StrIndexOf(sourceTxt[i+iPlus], ')') - (
                                                                   StrIndexOf(sourceTxt[i+iPlus], '(') + 1)), descrTxt);
          end else
          begin
            restStr := Copy(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '.') + 2,
                            StrIndexOf(sourceTxt[i+iPlus], ';') - (StrIndexOf(sourceTxt[i+iPlus], '.') + 1));
            res.Name := ReplaceStr(restStr, 'Proc', 'On');
          end;
        end;

        // Format functions
        if StartsStr('function', sourceTxt[i+iPlus]) then
        begin
          if StrContains(sourceTxt[i+iPlus], '(') then
          begin
            restStr := Copy(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '.') + 2,
                            StrIndexOf(sourceTxt[i+iPlus], '(') - (StrIndexOf(sourceTxt[i+iPlus], '.') + 1));
            res.Name := ReplaceStr(restStr, 'Func', 'On');
            res.Parameters := ParseParams(Copy(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '(') + 2,
                                                                   StrIndexOf(sourceTxt[i+iPlus], ')') - (
                                                                   StrIndexOf(sourceTxt[i+iPlus], '(') + 1)), descrTxt);
          end else
          begin
            restStr := Copy(sourceTxt[i+iPlus], StrIndexOf(sourceTxt[i+iPlus], '.') + 2,
                            StrIndexOf(sourceTxt[i+iPlus], ':') - (StrIndexOf(sourceTxt[i+iPlus], '.') + 1));
            res.Name := ReplaceStr(restStr, 'Func', 'On');
          end;

          SetLength(charArr, 1);
          charArr[0] := ';';
          restStr  := StrTrimRight(StrSubstring(sourceTxt[i+iPlus], StrLastIndexOf(sourceTxt[i+iPlus], ':') + 2), charArr);
          res.Return  := IfThen(SameText(restStr, 'TIntegerArray'), 'array of Integer', restStr);
        end;

        // Now we can assemble Description, after we have detected and removed parameters descriptions from it
        for j := 0 to descrTxt.Count - 1 do
          res.Description := res.Description + ' ' + descrTxt[j];

        // Now we have all the parts and can combine them however we like
        aList.Add('| ' + res.Version + ' | ' + res.Name + '<br><sub>' + res.Description + '</sub>' +
                  ' | <sub>' + res.Parameters + '</sub>' +
                  IfThen(aHasReturn, ' | <sub>' + res.Return + IfThen(res.ReturnDesc <> '', ' // ' + res.ReturnDesc) + '</sub>') +
                  ' |');
      end;
    end;
  finally
    FreeAndNil(sourceTxt);
    FreeAndNil(descrTxt);
  end;
end;


function DoSort(List: TStringList; Index1, Index2: Integer): Integer;
var
  A, B: string;
begin
  A := List[Index1];
  B := List[Index2];
  // Sort in assumption that method name is in the second || clause
  A := Copy(A, PosEx('| ', A, 2) + 2, 40);
  B := Copy(B, PosEx('| ', B, 2) + 2, 40);
  Result := CompareText(A, B);
end;


procedure TForm1.btnGenerateWikiClick(Sender: TObject);
begin
  GenerateWiki;
end;


procedure TForm1.GenerateWiki;
var
  listActions, listEvents, listStates: TStringList;
begin
  txtParserOutput.Lines.Clear;

  if FileExists(edtActionsFile.Text) then
  begin
    listActions := TStringList.Create;

    ParseText(edtActionsFile.Text, listActions, True);
    listActions.CustomSort(DoSort);

    listActions.Insert(0, '####Actions' + sLineBreak);
    listActions.Insert(1, '| Ver<br>sion | Action Description | Parameters<br>and types | Returns |');
    listActions.Insert(2, '| ------- | --------------- | -------------------- | ------- |');

    txtParserOutput.Lines.AddStrings(listActions);

    if edtOutputFileActions.Text <> '' then
      listActions.SaveToFile(edtOutputFileActions.Text);
    FreeAndNil(listActions);
  end;

  if FileExists(edtEventsFile.Text) then
  begin
    listEvents := TStringList.Create;

    ParseText(edtEventsFile.Text, listEvents, False);
    listEvents.CustomSort(DoSort);

    listEvents.Insert(0, '####Events' + sLineBreak);
    listEvents.Insert(1, '| Ver<br>sion | Event Description | Parameters<br>and types |');
    listEvents.Insert(2, '| ------- | --------------- | -------------------- |');

    txtParserOutput.Lines.AddStrings(listEvents);

    if edtOutputFileEvents.Text <> '' then
      listEvents.SaveToFile(edtOutputFileEvents.Text);
    FreeAndNil(listEvents);
  end;

  if FileExists(edtStatesFile.Text) then
  begin
    listStates := TStringList.Create;
    ParseText(edtStatesFile.Text, listStates, True);
    listStates.CustomSort(DoSort);

    listStates.Insert(0, '####States' + sLineBreak);
    listStates.Insert(1, '| Ver<br>sion | State Description | Parameters<br>and types | Returns |');
    listStates.Insert(2, '| ------- | --------------- | -------------------- | ------- |');

    txtParserOutput.Lines.AddStrings(listStates);

    if edtOutputFileStates.Text <> '' then
      listStates.SaveToFile(edtOutputFileStates.Text);
    FreeAndNil(listStates);
  end;

  if FileExists(edtUtilsFile.Text) then
  begin
    listStates := TStringList.Create;
    ParseText(edtUtilsFile.Text, listStates, True);
    listStates.CustomSort(DoSort);

    listStates.Insert(0, '####Utils' + sLineBreak);
    listStates.Insert(1, '| Ver<br>sion | Utility function<br>Description | Parameters<br>and types | Returns |');
    listStates.Insert(2, '| ------- | --------------- | -------------------- | ------- |');

    txtParserOutput.Lines.AddStrings(listStates);

    if edtOutputFileUtils.Text <> '' then
      listStates.SaveToFile(edtOutputFileUtils.Text);
    FreeAndNil(listStates);
  end;
end;


procedure TForm1.btnGenerateXMLClick(Sender: TObject);
begin
  GenerateXML;
end;


procedure TForm1.GenerateXML;
begin
  //
end;


procedure TForm1.txtParserOutputKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  // KaM
  fSettingsPath := ExtractFilePath(ParamStr(0)) + 'ScriptingParser.kmr.ini';
  LoadSettings;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  // KP
  fSettingsPath := ExtractFilePath(ParamStr(0)) + 'ScriptingParser.kp.ini';
  LoadSettings;
end;


procedure TForm1.edtOnTextChange(Sender: TObject);
begin
  if fUpdating then Exit;

  SaveSettings;
end;


procedure TForm1.SaveSettings;
var
  ini: TINIFile;
begin
  ini := TINIFile.Create(fSettingsPath);

  ini.WriteString('INPUT',  'Actions', edtActionsFile.Text);
  ini.WriteString('INPUT',  'Events',  edtEventsFile.Text);
  ini.WriteString('INPUT',  'States',  edtStatesFile.Text);
  ini.WriteString('INPUT',  'Utils',   edtUtilsFile.Text);
  ini.WriteString('OUTPUT', 'Actions', edtOutputFileActions.Text);
  ini.WriteString('OUTPUT', 'Events',  edtOutputFileEvents.Text);
  ini.WriteString('OUTPUT', 'States',  edtOutputFileStates.Text);
  ini.WriteString('OUTPUT', 'Utils',   edtOutputFileUtils.Text);

  FreeAndNil(ini);
end;


end.