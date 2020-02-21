####Actions

| Ver<br>sion | Action Description | Parameters<br>and types | Returns |
| ------- | ------------------------------------ | -------------- | ------- |
| 8250 | CampaignChapterSetup<br><sub> Sets up campaign chapter info in campaign menu. Campaign-only action!</sub> | <sub>**aChapter**: Integer; //_chapter index to set up_ <br> **aTitle**: String; //_text to display for the chapter title_ <br> **aShortTitle**: String; //_text to display for the chapter short title_ <br> **aBackgroundImg**: String; //_sprite to be used for the chapter background map (*.png)_</sub> | <sub></sub> |
| 8250 | CampaignMissionSetup<br><sub> Sets up all of the campaign mission info in campaign menu. Campaign-only action!</sub> | <sub>**aMission**: Integer; //_mission index to set up_ <br> **aUnlocked**: Boolean; //_Should it be available for selection and play_ <br> **aWon**: Boolean; //_should it be marked as won_ <br> **aFlagImgLocked**: String; //_sprite to be used for the locked state flag (*.png)_ <br> **aFlagImgNormal**: String; //_sprite to be used for the normal state flag (*.png)_ <br> **aFlagImgWon**: String; //_sprite to be used for the won state flag (*.png)_ <br> **aFlagPosX**: Integer; //_flag X position on the campaign map_ <br> **aFlagPosY**: Integer; //_flag Y position on the campaign map_ <br> **aTitle**: String; //_text to display for the mission title_ <br> **aBriefing**: String; //_text to display for the mission briefing_</sub> | <sub></sub> |
| 8261 | CampaignMissionUnlock<br><sub> Sets up unlocked/won status of a campaign mission in a campaign menu. Campaign-only action! aWon: should it be marked as won</sub> | <sub>**aMission**: Integer; //_mission index to set up_ <br> **aUnlocked**: Boolean; //_Should it be available for selection and play_</sub> | <sub></sub> |
| 8261 | CampaignProgress<br><sub> Sets up progress campaign info in campaign selection menu. Campaign-only action!</sub> | <sub>**aProgress**: String; //_campaign progress displayed in the campaign selection menu_</sub> | <sub></sub> |
| 8250 | CampaignSetup<br><sub> Sets up generic campaign info in campaign selection menu. Campaign-only action!</sub> | <sub>**aProgress**: String; //_campaign progress displayed in the campaign selection menu_ <br> **aNodeImg**: String; //_sprite to be used for the nodes between mission flags (*.png)_ <br> **aMissionNext**: Integer; //_which mission will be selected by default to be played next_</sub> | <sub></sub> |
| 8155 | CinematicBarsHide<br><sub> Hides cinematic black bars around the screen</sub> | <sub></sub> | <sub></sub> |
| 8155 | CinematicBarsShow<br><sub> Shows cinematic black bars around the screen</sub> | <sub></sub> | <sub></sub> |
| 8155 | CinematicBegin<br><sub> Starts cinematic mode. Blocks all viewport controls</sub> | <sub></sub> | <sub></sub> |
| 8155 | CinematicEnd<br><sub> Ends cinematic mode. Unblocks viewport controls</sub> | <sub></sub> | <sub></sub> |
| 8155 | CinematicFadeIn<br><sub> Gradually reveals the screen from full black</sub> | <sub>**aDurationSec**: Single; //_effect duration in seconds_</sub> | <sub></sub> |
| 8155 | CinematicFadeOut<br><sub> Gradually darkens the screen to full black</sub> | <sub>**aDurationSec**: Single; //_effect duration in seconds_</sub> | <sub></sub> |
| 8585 | CinematicSpeechBubble<br><sub> Shows speech bubble at specified location and height over terrain</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aHeight**: Single; <br> **aScale**: Byte; <br> **aText**: String; <br> **aDurationSec**: Single;</sub> | <sub></sub> |
| 8155 | CinematicSubtitle<br><sub> Shows the subtitles</sub> | <sub>**aText**: String;</sub> | <sub></sub> |
| 8155 | CinematicText<br><sub> Shows the text in the middle of the screen</sub> | <sub>**aText**: String; <br> **aScale**: Byte; //_Text scale 1..16_</sub> | <sub></sub> |
| 8155 | CinematicViewMoveTo<br><sub> Moves the camera</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aHeading**: Single; <br> **aZoom**: Single; <br> **aDurationSec**: Single; //_move duration in seconds_</sub> | <sub></sub> |
| 8155 | CinematicViewMoveToEx<br><sub> Moves the camera with more control over the setup</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aHeading**: Single; <br> **aPitch**: Single; <br> **aDist**: Single; <br> **aFOV**: Single; <br> **aDurationSec**: Single; //_move duration in seconds_</sub> | <sub></sub> |
| 8155 | CinematicViewReset<br><sub> Resets the camera to default orientation and zoom</sub> | <sub></sub> | <sub></sub> |
| 8155 | CinematicViewRevert<br><sub> Restores player viewport setup (position, orientation, zoom)</sub> | <sub></sub> | <sub></sub> |
| 8155 | CinematicViewSetTo<br><sub> Sets the camera</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aHeading**: Single; <br> **aZoom**: Single;</sub> | <sub></sub> |
| 8166 | CinematicViewSetToDefault<br><sub> Sets the camera X and Y. Heading and zoom are set to default</sub> | <sub>**aX**: Single; <br> **aY**: Single;</sub> | <sub></sub> |
| 8155 | CinematicViewSetToEx<br><sub> Sets the camera with more control over the setup</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aHeading**: Single; <br> **aPitch**: Single; <br> **aDist**: Single; <br> **aFOV**: Single;</sub> | <sub></sub> |
| 8155 | CinematicViewStore<br><sub> Saves player viewport setup (position, orientation, zoom)</sub> | <sub></sub> | <sub></sub> |
| 8461 | FenceAdd<br><sub> Set a fence on terrain</sub> | <sub>**X,Y**: Word; <br> **aDir**: Word; <br> **aFenceType**: Integer; //_Type of the fence (default = 1)_ <br> **aPlayer**: Integer; //_Owner of the fence_</sub> | <sub>Boolean // Success or fail</sub> |
| 8461 | FenceRemove<br><sub> Remove fence from terrain</sub> | <sub>**X,Y**: Word; <br> **aDir**: Word;</sub> | <sub></sub> |
| - | FogCoverAll<br><sub> Cover whole map with fog of war for specified player</sub> | <sub>**aPlayer**: Integer;</sub> | <sub></sub> |
| - | FogCoverCircle<br><sub> Cover circle with fog of war</sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word; <br> **aRadius**: Word;</sub> | <sub></sub> |
| - | FogCoverRect<br><sub> Cover rectangle with fog of war</sub> | <sub>**aPlayer**: Integer; <br> **X1**: Word; <br> **Y1**: Word; <br> **X2**: Word; <br> **Y2**: Word;</sub> | <sub></sub> |
| - | FogRevealAll<br><sub> Reveal whole map</sub> | <sub>**aPlayer**: Integer;</sub> | <sub></sub> |
| - | FogRevealCircle<br><sub> Reveal circle</sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word; <br> **aRadius**: Word;</sub> | <sub></sub> |
| - | FogRevealRect<br><sub> Reveal rectangle</sub> | <sub>**aPlayer**: Integer; <br> **X1**: Word; <br> **Y1**: Word; <br> **X2**: Word; <br> **Y2**: Word;</sub> | <sub></sub> |
| - | GiveGroup<br><sub> Gives group to a player</sub> | <sub>**aPlayer**: Integer; <br> **aUnitType**: TKMUnitType; <br> **X,Y**: Word; <br> **aDir**: Word; <br> **aCount**: Word; <br> **aColumns**: Word;</sub> | <sub>Integer // UID of the group on success</sub> |
| 4433 | GiveHouse<br><sub> Places house on terrain, removing removable objects below it (trees and such)</sub> | <sub>**aPlayer**: Integer; <br> **aHouseType**: TKMHouseType; <br> **X,Y**: Word; <br> **aFace**: TKMHouseFace;</sub> | <sub>Integer // UID of the house on success</sub> |
| - | GiveUnit<br><sub> Gives unit to a player</sub> | <sub>**aPlayer**: Integer; <br> **aUnitType**: TKMUnitType; <br> **X,Y**: Word; <br> **aDir**: Word;</sub> | <sub>Integer // UID of the unit on success</sub> |
| - | GiveWares<br><sub> Wares are added to first Camp</sub> | <sub>**aPlayer**: Integer; <br> **aWareType**: TKMWareType; <br> **aCount**: Word;</sub> | <sub></sub> |
| - | GiveWeapons<br><sub> Weapons are added to first Barracks</sub> | <sub>**aPlayer**: Integer; <br> **aWareType**: TKMWareType; <br> **aCount**: Word;</sub> | <sub></sub> |
| - | GroupOrderAttackHouse<br><sub></sub> | <sub>**aGroupID**: Integer; <br> **aHouseID**: Integer;</sub> | <sub></sub> |
| - | GroupOrderAttackUnit<br><sub></sub> | <sub>**aGroupID**: Integer; <br> **aUnitID**: Integer;</sub> | <sub></sub> |
| - | GroupOrderFood<br><sub></sub> | <sub>**aGroupID**: Integer;</sub> | <sub></sub> |
| - | GroupOrderHalt<br><sub></sub> | <sub>**aGroupID**: Integer;</sub> | <sub></sub> |
| - | GroupOrderLink<br><sub></sub> | <sub>**aGroupID**: Integer; <br> **aDestGroupID**: Integer;</sub> | <sub></sub> |
| - | GroupOrderSplit<br><sub></sub> | <sub>**aGroupID**: Integer;</sub> | <sub>Integer // UID of the separated group</sub> |
| - | GroupOrderStorm<br><sub></sub> | <sub>**aGroupID**: Integer;</sub> | <sub></sub> |
| - | GroupOrderWalk<br><sub></sub> | <sub>**aGroupID**: Integer; <br> **X**: Word; <br> **Y**: Word; <br> **aDirection**: Word;</sub> | <sub></sub> |
| 6982 | GroupOwnerChange<br><sub> Change owner of the group. Technically it kills old units and creates new ones with the same basic props (type, position, direction, hp, condition). All the advanced props and states do not get copied over. If old group was moving/fighting, it is not guaranteed that new group units will be placed on the same positions</sub> | <sub>**aGroupId**: Integer; <br> **aPlayer**: Integer;</sub> | <sub>Integer // UID of new group</sub> |
| - | GroupSetFormation<br><sub></sub> | <sub>**aGroupID**: Integer; <br> **aNumColumns**: Byte;</sub> | <sub></sub> |
| - | HouseAddDamage<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aDamage**: Word; //_number of hitpoints to take from the house_</sub> | <sub></sub> |
| - | HouseAddRepair<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aRepair**: Word; //_number of hitpoints to give to the house_</sub> | <sub></sub> |
| -7981 | HouseAddWaresTo<br><sub> Renamed into HouseWareAdd</sub> | <sub>**aHouseID**: Integer; <br> **aWareType**: TKMWareType; <br> **aCount**: Word;</sub> | <sub></sub> |
| - | HouseAllow<br><sub> Allow or block the house from being built</sub> | <sub>**aPlayer**: Integer; <br> **aHouseType**: TKMHouseType; <br> **aAllowed**: Boolean;</sub> | <sub></sub> |
| - | HouseDestroy<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aSilent**: Boolean; //_Wherever to play the sound and leave rubble on terrain or not_</sub> | <sub></sub> |
| 5194 | HouseOwnerChange<br><sub> Change owner of the House. Technically it kills old House and creates a new one with the same basic props (type, position, direction, hp, ..). All the advanced props and states do not get copied over. Wares do not get copied over yet.</sub> | <sub>**aHouseID**: Integer; <br> **aPlayer**: Integer;</sub> | <sub>Integer // UID of new House</sub> |
| - | HouseRepairEnable<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aRepairEnabled**: Boolean;</sub> | <sub></sub> |
| 4820 | HouseTrainQueueAdd<br><sub> Train units in the house (School/Fort/Barracks)</sub> | <sub>**aHouseID**: Integer; <br> **aUnitType**: TKMUnitType; <br> **aCount**: Integer;</sub> | <sub>Integer // number of units added to the queue</sub> |
| 4820 | HouseTrainQueueRemove<br><sub> Try to remove units from training queue in the house (School/Fort/Barracks)</sub> | <sub>**aHouseID**: Integer; <br> **aQueueIndex**: Integer; //_Should be in 0..5 range_</sub> | <sub></sub> |
| - | HouseUnlock<br><sub> Allow the house to be built irregardless of preceeding houses availability</sub> | <sub>**aPlayer**: Integer; <br> **aHouseType**: TKMHouseType;</sub> | <sub></sub> |
| 7981 | HouseWareAdd<br><sub> Adds wares to specified house</sub> | <sub>**aHouseID**: Integer; <br> **aWareType**: TKMWareType; <br> **aCount**: Word; //_number of wares to add. Gets trimmed to not exceed house max storage_</sub> | <sub></sub> |
| 7021 | HouseWareInBlock<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aWareType**: TKMWareType; <br> **aBlock**: Integer;</sub> | <sub></sub> |
| 7985 | HouseWareRemove<br><sub> Removes wares from specified house. Works only on complete houses</sub> | <sub>**aHouseID**: Integer; <br> **aWareType**: TKMWareType; <br> **aCount**: Word; //_number of wares to take_</sub> | <sub>Word // number of wares that were actually taken</sub> |
| - | HouseWeaponsOrderSet<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aWareType**: TKMWareType; <br> **aAmount**: Integer;</sub> | <sub></sub> |
| - | HouseWoodcutterChopOnly<br><sub></sub> | <sub>**aHouseID**: Integer; <br> **aChopOnly**: Boolean;</sub> | <sub></sub> |
| - | PlanAddField<br><sub></sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word;</sub> | <sub>Boolean // success or fail</sub> |
| 4433 | PlanAddHouse<br><sub> Places house plan on terrain, removing removable objects below it (trees and such)</sub> | <sub>**aPlayer**: Integer; <br> **aHouseType**: TKMHouseType; <br> **X,Y**: Word; <br> **aFace**: TKMHouseFace;</sub> | <sub>Boolean // success or fail</sub> |
| - | PlanAddOrchard<br><sub></sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word;</sub> | <sub>Boolean // success or fail</sub> |
| - | PlanAddRoad<br><sub></sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word;</sub> | <sub>Boolean // success or fail</sub> |
| - | PlanRemove<br><sub> Removes any house or fieldwork plan</sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word;</sub> | <sub>Boolean // success or fail</sub> |
| 5374 | PlayerAIArmyCompositionReset<br><sub> Reset the rate at which AI should equip new warriors to 0</sub> | <sub>**aPlayer**: Integer;</sub> | <sub></sub> |
| 5374 | PlayerAIArmyCompositionSet<br><sub> Change the rate at which AI should equip new warriors (units per hour)</sub> | <sub>**aPlayer**: Integer; <br> **aUnitType**: TKMUnitType; <br> **aWarriorsPerHour**: Word;</sub> | <sub></sub> |
| 5735 | PlayerAIDispositionAdd<br><sub> Add disposition for players AI</sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word; <br> **aDir**: Word; <br> **aGroupType**: Word; <br> **TKMGroupType**: Word; <br> **aGuardRadius**: Word; <br> **aNumUnits**: Word; <br> **aUnitsPerRow**: Word;</sub> | <sub>Boolean // Success or fail (due to bad parameters or already existing position)</sub> |
| 5735 | PlayerAIDispositionRemove<br><sub> Remove disposition</sub> | <sub>**aPlayer**: Integer; <br> **X**: Word; <br> **Y**: Word;</sub> | <sub> // Success or fail</sub> |
| 4053 | PlayerAllianceChange<br><sub> Change alliance between players. Always symmetrical</sub> | <sub>**aPlayer1**: Integer; <br> **aPlayer2**: Integer; <br> **aAllied**: Boolean; //_Ally or enemy_ <br> **aShareFOW**: Boolean; //_Start sharing FOW between players_</sub> | <sub></sub> |
| 5422 | PlayerColorChange<br><sub> Change players color. Note that animals have their own colors on the minimap</sub> | <sub>**aPlayer**: Integer; //_Player index (0..N-1)_ <br> **aColor**: Integer; //_New color_</sub> | <sub></sub> |
| - | PlayerDefeat<br><sub> Set player defeated</sub> | <sub>**aPlayer**: Integer;</sub> | <sub></sub> |
| - | PlayerGoalsSetDefault<br><sub> Add default multiplayer goals for a player - to kill all enemies.</sub> | <sub>**aPlayer**: Integer; //_Player index (0..N-1)_ <br> **aBuildings**: Boolean; //_destroy core houses too_</sub> | <sub></sub> |
| 8180 | PlayerMessage<br><sub> Send a message to the player. Message gets stored in message log</sub> | <sub>**aPlayer**: Integer; //_can be -1 to send the message to all the players_ <br> **aText**: String; //_text with libx codes to substitute_ <br> **aOpen**: Boolean; //_should the message be opened to the player at once_</sub> | <sub></sub> |
| -8131 | PlayerMessageFormatted<br><sub> Formatted messages can be made with Utils.Format()</sub> | <sub>**aPlayer**: Integer; <br> **aText**: String; <br> **Params**: array of const;</sub> | <sub></sub> |
| -8180 | PlayerMessageGoto<br><sub> Goto messages should be done with Actions.PlayerMessageWithButtons</sub> | <sub>**aPlayer**: Integer; <br> **aX**: Word; <br> **aY**: Word; <br> **aText**: String;</sub> | <sub></sub> |
| -8131 | PlayerMessageGotoFormatted<br><sub> Formatted messages can be made with Utils.Format()</sub> | <sub>**aPlayer**: Integer; <br> **aX**: Word; <br> **aY**: Word; <br> **aText**: String; <br> **Params**: array of const;</sub> | <sub></sub> |
| -8180 | PlayerMessageOpen<br><sub> Adjoined with PlayerMessage with a boolean key</sub> | <sub>**aPlayer**: Integer; <br> **aText**: String;</sub> | <sub></sub> |
| 8180 | PlayerMessageWithButtons<br><sub> Send a message to the player Message result will return asynchronously in the `OnScriptButton` event from each player (possibly even in different ticks). In multiplayer games, event might be several ticks later due to lag. In rare cases, when player cheats, he can miss the message altogether (e.g. by viewing different Hand during message invocation).</sub> | <sub>**aPlayer**: Integer; <br> **aText**: String; //_Message text_ <br> **aButtons**: array of String; //_Array of button captions. Can be up to 8_ <br> **aImages**: array of String; <br> **aTags**: array of Integer; //_Array of button tags (will be used in click event)_ <br> **aOpen**: Boolean; //_Opens the message and sets the game on pause after current tick is done_ <br> **aBlockAfterClick**: Boolean; //_Block buttons after click_</sub> | <sub></sub> |
| 5027 | PlayerNameSet<br><sub> Rename a player (works only in Singleplayer and for AIs in Multiplayer) Note: renaming a player updates texts for all affected objectives created from goals</sub> | <sub>**aPlayer**: Integer; <br> **aName**: String;</sub> | <sub></sub> |
| 3026 | PlayerObjectiveAdd<br><sub> Add objective for the player</sub> | <sub>**aPlayer**: Integer; <br> **aObjectiveType**: TKMObjectiveType; //_type of the objective (see TKMObjectiveType for details)_ <br> **aPriority**: Integer; //_Affects objective position in the list. Smaller numbers come first. Otherwise objectives keep order in which they were added_ <br> **aStatus**: TKMObjectiveStatus; //_status of the objective (see TKMObjectiveStatus for details)_ <br> **aCaption**: String; //_text displayed_</sub> | <sub>Integer // UID of the objective</sub> |
| 3026 | PlayerObjectiveUpdateStatus<br><sub> Update objective status</sub> | <sub>**aPlayer**: Integer; <br> **aObjectiveId**: Integer; <br> **aStatus**: TKMObjectiveStatus;</sub> | <sub></sub> |
| - | PlayerObjectiveUpdateText<br><sub> Update objective text displayed in GUI. Color-coding is supported</sub> | <sub>**aPlayer**: Integer; <br> **aObjectiveId**: Integer; <br> **aText**: String;</sub> | <sub></sub> |
| 4947 | PlayerOverlayAppend<br><sub></sub> | <sub>**aPlayer**: Integer; <br> **aText**: String;</sub> | <sub></sub> |
| -8131 | PlayerOverlayAppendFormatted<br><sub> Formatted messages can be made with Utils.Format()</sub> | <sub>**aPlayer**: Integer; <br> **aText**: String; <br> **Params**: array of const;</sub> | <sub></sub> |
| 4947 | PlayerOverlaySet<br><sub></sub> | <sub>**aPlayer**: Integer; <br> **aText**: String;</sub> | <sub></sub> |
| -8131 | PlayerOverlaySetFormatted<br><sub> Formatted messages can be made with Utils.Format()</sub> | <sub>**aPlayer**: Integer; <br> **aText**: String; <br> **Params**: array of const;</sub> | <sub></sub> |
| - | PlayerShareFog<br><sub> Start or stop sharing FOW between players. This can be done assymetrically True means that aPlayer1 shares his FOW with aPlayer2 (in other words, P1 allows P2 to see his FOW</sub> | <sub>**aPlayer1**: Integer; <br> **aPlayer2**: Integer; <br> **aShare**: Boolean;</sub> | <sub></sub> |
| 8460 | PlayerTradeAllow<br><sub> Allows or forbids trading of certain ware in Marketplace</sub> | <sub>**aPlayer**: Integer; <br> **aWareType**: TKMWareType; <br> **aAllowed**: Boolean;</sub> | <sub></sub> |
| - | PlayerWareDistribution<br><sub> Change ware distribution between players houses</sub> | <sub>**aPlayer**: Integer; <br> **aWareType**: TKMWareType; <br> **aHouseType**: TKMHouseType; <br> **aAmount**: Byte; //_New value (0..5)_</sub> | <sub></sub> |
| - | PlayerWin<br><sub> Sets all player IDs in aVictors to victorious. All other players are set to defeated.</sub> | <sub>**aVictors**: array of Integer; <br> **aTeamVictory**: Boolean; //_If all teammates win too_</sub> | <sub></sub> |
| - | PlayWAV<br><sub> Play WAV file</sub> | <sub>**aPlayer**: Integer; <br> **aFilename**: String; //_Name of the file from the map folder, without a path. Must have ".wav" extension._ <br> **aVolume**: Single; //_Playback volume. From 0.0 to 1.0_</sub> | <sub></sub> |
| - | PlayWAVAtLocation<br><sub> Play WAV file at specified location on map</sub> | <sub>**aPlayer**: Integer; <br> **aFilename**: String; //_Name of the file from the map folder, without a path. Must have ".wav" extension._ <br> **aVolume**: Single; //_Playback volume. From 0.0 to 1.0_ <br> **X**: Word; //_X tile coordinate_ <br> **Y**: Word; //_Y tile coordinate_</sub> | <sub></sub> |
| 4586 | StockpileAdd<br><sub> Add stockpile on the map</sub> | <sub>**aWareType**: TKMWareType; //_Ware type_ <br> **aX**: Word; <br> **aY**: Word; <br> **aCount**: Word; //_Ware count. Must be positive_</sub> | <sub>Integer // UID of the stockpile in case of success</sub> |
| 4586 | StockpileSetCount<br><sub> Change number of wares in a stockpile</sub> | <sub>**aStockpileID**: Integer; //_UID of the stockpile_ <br> **aCount**: Word; //_New ware count. If zero, stockpile will be removed_</sub> | <sub></sub> |
| 8166 | TerrainHighlightDelete<br><sub> Delete highlight previously placed on terrain</sub> | <sub>**aUID**: Integer;</sub> | <sub></sub> |
| 8166 | TerrainHighlightFill<br><sub> Add highlighted area to terrain</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aWidth**: Single; <br> **aHeight**: Single; <br> **aColor**: Cardinal;</sub> | <sub>Integer</sub> |
| 8166 | TerrainHighlightLine<br><sub> Add outline highlight to terrain</sub> | <sub>**aX**: Single; <br> **aY**: Single; <br> **aWidth**: Single; <br> **aHeight**: Single; <br> **aThickness**: Single; <br> **aColor**: Cardinal;</sub> | <sub>Integer</sub> |
| 6620 | TerrainParticleEmitterAdd<br><sub> Adds particle emitter on to terrain. Replaces any existing emitter on the spot</sub> | <sub>**aX**: Word; <br> **aY**: Word; <br> **aType**: Integer;</sub> | <sub></sub> |
| 6620 | TerrainParticleEmitterDelete<br><sub> Remove particle emitter from terrain</sub> | <sub>**aX**: Word; <br> **aY**: Word;</sub> | <sub></sub> |
| 5094 | TerrainTriggerAdd<br><sub> Adds rectangle trigger area on to terrain</sub> | <sub>**aLeft**: Word; <br> **aTop**: Word; <br> **aRight**: Word; <br> **aBottom**: Word;</sub> | <sub>Integer // Id of trigger in case of success. Otherwise -1.</sub> |
| 5094 | TerrainTriggerDelete<br><sub> Remove trigger area from terrain</sub> | <sub>**aId**: Integer;</sub> | <sub></sub> |
| 7968 | UnitCarryGive<br><sub> Give wares to the unit (only Wagons supported yet)</sub> | <sub>**aUnitID**: Integer; <br> **aCarry**: TKMWareType; <br> **aCount**: Integer;</sub> | <sub>Integer // number of wares Given (could be 0 or smaller than requested due to max Wagon capacity and ware type mismatch)</sub> |
| 2732 | UnitCarryTake<br><sub> Take wares from the unit (only Wagons supported yet)</sub> | <sub>**aUnitID**: Integer; <br> **aCarry**: TKMWareType; <br> **aCount**: Integer;</sub> | <sub>Integer // number of wares taken (0 if unsuccessfull)</sub> |
| - | UnitDirectionSet<br><sub> Make idle unit face specified direction</sub> | <sub>**aUnitID**: Integer; <br> **aDir**: Integer;</sub> | <sub>Boolean // success or fail</sub> |
| 6692 | UnitHungerSet<br><sub> Set unit hunger level.</sub> | <sub>**aUnitID**: Integer; //_ID of the unit_ <br> **aHungerSec**: Integer; //_Hunger level in seconds of unit life. Should be within 0 and 2700 (45min)_</sub> | <sub></sub> |
| - | UnitKill<br><sub> Kills a unit Actual death could still take up to a couple of ticks, until all internal interactions are resolved Units in training can not die until they are trained.</sub> | <sub>**aUnitID**: Integer; <br> **aSilent**: Boolean; //_Makes unit die without exiting house, death animation and sound_</sub> | <sub></sub> |
| - | UnitOrderWalk<br><sub> Order a unit to walk to location. Can not order to animals. Only idle units can be ordered to walk.</sub> | <sub>**aUnitID**: Integer; <br> **X**: Word; <br> **Y**: Word;</sub> | <sub>Boolean // success or fail</sub> |
| 5128 | UnitOwnerChange<br><sub> Change owner of the unit. Technically it kills old unit and creates a new one with the same basic props (type, position, direction, hp, condition, wares). All the advanced props and states do not get copied over. Warriors need to change owner via GroupOwnerChange (even single ones)</sub> | <sub>**aUnitID**: Integer; <br> **aPlayer**: Integer;</sub> | <sub>Integer // UID of new unit</sub> |