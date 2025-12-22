BEGIN RL#MARG

IF ~StateCheck("RL#MARG",STATE_CHARMED)~ THEN BEGIN CharmedMargarita
SAY @500 /* I am Margarita Zelleod. There are things you don't know, and people of great power that have already arrayed against you. You're in danger. Before, I didn't care, but for some reason I do now. Please be careful, I wouldn't want anything to happen to you! */
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeet
SAY @501 /* WOAH, you scared me, you did! What are you doing here? Don't you know these mines are infested? */
IF ~~ THEN REPLY @502 /* We're here trying to investigate the happenings in these mines, what about you? */ GOTO Friendly
IF ~~ THEN REPLY @503 /* We could certainly ask you the same question, Halfling. */ GOTO Cautious
IF ~~ THEN REPLY @504 /* My business is my own, Halfling, now leave us be! */ GOTO GoAway
END

IF ~~ THEN BEGIN Friendly
SAY @505 /* I'm here on business, but I seem to be lost and my group has not yet returned. */
IF ~~ THEN REPLY @506 /* Your group? Returned from where? And what is your purpose for being here? */ GOTO Cautious
IF ~~ THEN REPLY @507 /* Then you may return to your business, for I care not for what it is! */ GOTO GoAway
IF ~~ THEN REPLY @508 /* Mayhap you should join with us, then? I fear your group may not return. */ GOTO Joining
END

IF ~~ THEN BEGIN Cautious
SAY @509 /* I'm Probably here for the same reasons you are. I mean, why else would I be in this horribly dank place? */
IF ~~ THEN REPLY @510 /* I think it best you come with us, so that I may gauge that for myself. */ GOTO Joining
IF ~~ THEN REPLY @511 /* If that be the case, then I shall be on my way. */ GOTO GoAway
END

IF ~~ THEN BEGIN GoAway
SAY @512 /* Then take care travelers, these mines seem more dangerous than at first glance! */
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Joining
SAY @513 /* Very well, just don't throw me into open combat please, I'm a very delicate girl. */
IF ~~ DO ~SetGlobal("RL#MARGJoined","LOCALS",1)
JoinParty()~ EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ReturnDialogue
SAY @514 /* I thought you guys had gone forward, What do you want? */
IF ~~ THEN REPLY @515 /* We decided that you should come with us, I think it best for all involved if you do. */ GOTO Rejoin
IF ~~ THEN REPLY @516 /* Nothing, I thought you were a kobold for a second, my mistake. */ GOTO RefusedRudely
END

IF ~~ THEN BEGIN RefusedRudely
SAY @517 /* A Kobold?! That's it! So long, you pig faced ruffians! I tire of being pestered by the likes of you! */
IF ~~ DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Rejoin
SAY @518 /* Maybe it will be a good idea, so long as I don't wind up on a dinner table by the end of the day. */
IF ~~ DO ~SetGlobal("RL#MARGJoined","LOCALS",1)
JoinParty()~ EXIT
END

BEGIN RL#MARGP

IF ~Global("RL#MARGJoined","LOCALS",1)~ THEN BEGIN LeaveGroup
SAY @519 /* So it is time for us to part ways? */
IF ~~ THEN REPLY @520 /* My goodness no, please stay with us, you are proving to be very useful. */ DO ~JoinParty()~ EXIT
IF ~~ THEN REPLY @521 /* Unfortunately yes, but perhaps we can meet again later. */ DO ~SetGlobal("RL#MARGJoined","LOCALS",0)~ EXIT
END

IF ~Global("RL#MARGJoined","LOCALS",0)~ THEN BEGIN ComeBack
SAY @522 /* And here I thought I'd be waiting here forever, but I think it's time we should be off. */
IF ~~ THEN REPLY @523 /* I concurr, let us continue on our journey for answers. */ GOTO JourneyAgain
IF ~~ THEN REPLY @524 /* I'm actually not here for that, but it's good to see you again. */ GOTO JustRefused
END

IF ~~ THEN BEGIN JourneyAgain
SAY @525 /* Wonderful! All that waiting has paid off! */
IF ~~ DO ~SetGlobal("RL#MARGJoined","LOCALS",1)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN JustRefused
SAY @526 /* It's great to see you too, I guess I'll just stay right here until you need me. It's not like I can do much else. */
IF ~~ THEN EXIT
END
