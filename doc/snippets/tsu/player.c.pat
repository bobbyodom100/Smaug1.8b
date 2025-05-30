--- player.c	Sun Jun 29 12:58:05 1997
+++ new/player.c	Sun Jun 29 13:08:45 1997
@@ -192,7 +192,7 @@
 	IS_SET(ch->pcdata->flags, PCFLAG_PAGERON) ? 'X' : ' ',
 	ch->pcdata->pagerlen, IS_SET(ch->act, PLR_AUTOEXIT) ? 'X' : ' ');
 
-    if (IS_VAMPIRE(ch))
+    if (IS_VAMPIRE(ch) || IS_DEMON(ch))
 	ch_printf(ch, "XP   : %-9d       Blood: %-5d of %5d   MKills:  %-5.5d    AutoLoot(%c)\n\r",
 		ch->exp, ch->pcdata->condition[COND_BLOODTHIRST], 10 + ch->level, ch->pcdata->mkills,
 		IS_SET(ch->act, PLR_AUTOLOOT) ? 'X' : ' ');
@@ -494,7 +494,7 @@
       ch_printf( ch, "You are mobinvis at level %d.\n\r",
             ch->mobinvis);
 
-    if ( IS_VAMPIRE(ch) )
+    if ( IS_VAMPIRE(ch) || IS_DEMON(ch) )
       ch_printf( ch,
 	"You have %d/%d hit, %d/%d blood level, %d/%d movement, %d practices.\n\r",
 	ch->hit,  ch->max_hit,
@@ -1021,7 +1021,7 @@
        return;
     }
 
-    if ( IS_VAMPIRE(ch) )
+    if ( IS_VAMPIRE(ch) || IS_DEMON(ch) )
       ch_printf( ch,
 	"You report: %d/%d hp %d/%d blood %d/%d mv %d xp.\n\r",
 	ch->hit,  ch->max_hit,
@@ -1036,7 +1036,7 @@
 	ch->move, ch->max_move,
 	ch->exp   );
 
-    if ( IS_VAMPIRE(ch) )
+    if ( IS_VAMPIRE(ch) || IS_DEMON(ch) )
       sprintf( buf, "$n reports: %d/%d hp %d/%d blood %d/%d mv %d xp.\n\r",
 	ch->hit,  ch->max_hit,
 	ch->pcdata->condition[COND_BLOODTHIRST], 10 + ch->level,
