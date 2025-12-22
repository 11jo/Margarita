BEGIN RL#MARGJ

INTERJECT MULAHE 3 rl#margmulahe1
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG")~ THEN
@1500 /* Oh no you don't! You're not going anywhere! */
END MULAHE 4

INTERJECT_COPY_TRANS XAN 0 rl#margxan1
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG")~ THEN
@1501 /* How did this fool even get this far unnoticed? Send him away, <CHARNAME>. He's completely useless if all he does is get caught. */
END

INTERJECT_COPY_TRANS NIMBUL 0 rl#margnimbul1
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") Global("NimbulDeathvariable","GLOBAL",0)~ THEN
@1502 /* An assassin?! */ DO ~SetGlobal("NimbulDeathvariable","GLOBAL",1)~
END

INTERJECT_COPY_TRANS BRAGE 0 rl#margBrage
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG")~ THEN
@1503 /* This is ridiculous. Forget his riddles and just finish the job so we may turn it in for the bounty. */
END

INTERJECT_COPY_TRANS GALLOR 1 rl#margGallor
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG")~ THEN
@1504 /* I would advise against this, <CHARNAME>. You have an initial contract with Mr. Charleston. Breaking that contract would be a gross violation of my code of ethics. */
END

INTERJECT_COPY_TRANS GANDOL 15 rl#margGandollar
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG")~ THEN
@1505 /* Don't do it, <CHARNAME>. It is a waste of time if the Halfling cannot pay with a decent amount of coin for a day's worth of work. */
END

INTERJECT_COPY_TRANS ENDER 5 rl#margender1
== RL#MARGJ IF ~IsValidForPartyDialogue("RL#MARG") Global("RL#NashkelMinesExit","GLOBAL",4)~ THEN
@1506 /* Your soft soled shoes didn't stop you from getting captured, now did it? Sorry excuse for a spy! */ DO ~SetGlobal("RL#NashkelMinesExit","GLOBAL",5)~
== ENDER IF ~IsValidForPartyDialogue("RL#MARG")~ THEN
@1507 /* Unfortunately no, but then again, I think I should have realized that I was being hounded by a none too helpful Halfling. */
== RL#MARGJ IF ~IsValidForPartyDialogue("RL#MARG")~ THEN
@1508 /* You should know better than anybody that you can't trust anyone in this business! */
== ENDER @1509 /* Well that definitely means that my new saviors here cannot trust you either, deceiver. */
== RL#MARGJ @1510 /* I'm not the one getting caught because of my careless behavior! */
== ENDER IF ~IsValidForPartyDialogue("RL#MARG")~ THEN
@1511 /* You are a spy, Halfling. I will admit, a useful one; but a spy nonetheless. One of the only things about you I could never figure out is who you work for. Why don't you indulge me? */
== RL#MARGJ @1512 /* I can't tell you that. */
== ENDER @1513 /* Well <CHARNAME>, I think it best that you desert this little liar. Nothing good can come from you helping her, especially if you intend to fight the Iron Throne. */
END

INTERJECT_COPY_TRANS BREVLI 13 rl#MargBrevlik
== RL#MARGJ IF ~IsValidForPartyDialogue("RL#MARG")~ THEN
@1514 /* Oh this is a wonderful idea, and more than worth it, with no dirty work. I suggest you take his asking price and get it done with all haste, <CHARNAME>! */
END

INTERJECT_COPY_TRANS ABELA 5 rl#MargAbela
== RL#MARGJ IF ~IsValidForPartyDialogue("RL#MARG") Global("HelpRamazith","GLOBAL",1)~ THEN
@1515 /* You can't let her go, <CHARNAME>. Ramazith is waiting with our payment for bringing this creature back to him. */
END

INTERJECT IRON13 0 rl#margiron13
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") GlobalLT("MargaritaBackfire","GLOBAL",1)~ THEN
@1516 /* Hello, how are you today? */
== IRON13 @1517 /* Why hello, Margarita; I am quite well, what are you doing with these rough types? */
== RL#MARGJ @1518 /* They are from the Iron Throne Sembia branch and I am just leading them upstairs so they may deliver a message. */
END IRON13 4

INTERJECT IRON14 0 rl#margiron14
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") GlobalLT("MargaritaBackfire","GLOBAL",1)~ THEN
@1519 /* Excuse us, our guests here are here from Sembia, and we just need to deliver a message to the upper floors. */
END IRON14 4

INTERJECT_COPY_TRANS KENT 2 rl#MargKent1
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG")~ THEN
@1520 /* Any person who would just desert their post like you're doing becomes as useless as horse dung. */
END

INTERJECT_COPY_TRANS TAMOKO 21 rl#margtamoko1
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") Global("MargaritaBackfire","GLOBAL",1)~ THEN
@1521 /* Unfortunately Tamoko isn't the only one who follows orders. My ultimate mission was to be sure that you did not face Sarevok, it is time for you to die, <CHARNAME>. It's nothing personal, just business. */
DO ~ActionOverride("TAMOKO",Enemy())
ActionOverride("RL#MARG",LeaveParty())
ActionOverride("RL#MARG",Enemy())~
END

INTERJECT_COPY_TRANS TAMOKO 24 rl#margtamoko2
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") Global("MargaritaBackfire","GLOBAL",1)~ THEN
@1521 /* Unfortunately Tamoko isn't the only one who follows orders. My ultimate mission was to be sure that you did not face Sarevok, it is time for you to die, <CHARNAME>. It's nothing personal, just business. */
DO ~ActionOverride("TAMOKO",Enemy())
ActionOverride("RL#MARG",LeaveParty())
ActionOverride("RL#MARG",Enemy())~
END

INTERJECT_COPY_TRANS TAMOKO3 13 rl#margtamoko3
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") Global("MargaritaBackfire","GLOBAL",1)~ THEN
@1521 /* Unfortunately Tamoko isn't the only one who follows orders. My ultimate mission was to be sure that you did not face Sarevok, it is time for you to die, <CHARNAME>. It's nothing personal, just business. */
DO ~ActionOverride("TAMOKO",Enemy())
ActionOverride("RL#MARG",LeaveParty())
ActionOverride("RL#MARG",Enemy())~
END

INTERJECT_COPY_TRANS TAMOKO3 12 rl#margtamoko4
== RL#MARGJ IF ~InParty("RL#MARG") !StateCheck("RL#MARG",CD_STATE_NOTVALID) InMyArea("RL#MARG") Global("MargaritaBackfire","GLOBAL",1)~ THEN
@1521 /* Unfortunately Tamoko isn't the only one who follows orders. My ultimate mission was to be sure that you did not face Sarevok, it is time for you to die, <CHARNAME>. It's nothing personal, just business. */
DO ~ActionOverride("TAMOKO",Enemy())
ActionOverride("RL#MARG",LeaveParty())
ActionOverride("RL#MARG",Enemy())~
END
