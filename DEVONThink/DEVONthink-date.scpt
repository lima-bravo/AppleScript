FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� 
  Create a diary entry with weekly and daily focus, order in quarters and weeks, based on date provided in the dialog.
  
	Using input from:
  	- https://macscripter.net/viewtopic.php?id=24737
	- https://discourse.devontechnologies.com/t/read-only-file-system-error-when-calling-shell-script-within-applescript/73923/8
	- https://discourse.devontechnologies.com/t/applescript-access-denied-issues-with-import-to/73673
      � 	 	J   
     C r e a t e   a   d i a r y   e n t r y   w i t h   w e e k l y   a n d   d a i l y   f o c u s ,   o r d e r   i n   q u a r t e r s   a n d   w e e k s ,   b a s e d   o n   d a t e   p r o v i d e d   i n   t h e   d i a l o g . 
     
 	 U s i n g   i n p u t   f r o m : 
     	 -   h t t p s : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 2 4 7 3 7 
 	 -   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / r e a d - o n l y - f i l e - s y s t e m - e r r o r - w h e n - c a l l i n g - s h e l l - s c r i p t - w i t h i n - a p p l e s c r i p t / 7 3 9 2 3 / 8 
 	 -   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / a p p l e s c r i p t - a c c e s s - d e n i e d - i s s u e s - w i t h - i m p o r t - t o / 7 3 6 7 3 
     
  
 l      ��  ��    ~ x
-- redundant code 
 --needed for ui_get_dateuse scripting additionsuse framework "Foundation"use framework "AppKit"     �   � 
 - -   r e d u n d a n t   c o d e   
   - - n e e d e d   f o r   u i _ g e t _ d a t e  u s e   s c r i p t i n g   a d d i t i o n s  u s e   f r a m e w o r k   " F o u n d a t i o n "  u s e   f r a m e w o r k   " A p p K i t "       l      ��  ��     

Subroutine Block

     �   ( 
 
 S u b r o u t i n e   B l o c k 
 
      l     ��������  ��  ��        i         I      �� ���� 0 
year_start     ��  o      ���� 0 thedate theDate��  ��    k     %       s          o     ���� 0 thedate theDate   o      ���� 0 	yearstart 	yearStart   ! " ! r    
 # $ # m    ��
�� 
jan  $ n      % & % m    	��
�� 
mnth & o    ���� 0 	yearstart 	yearStart "  ' ( ' r     ) * ) m    ����  * n      + , + 1    ��
�� 
day  , o    ���� 0 	yearstart 	yearStart (  - . - r     / 0 / m    ����   0 n      1 2 1 1    ��
�� 
hour 2 o    ���� 0 	yearstart 	yearStart .  3 4 3 r     5 6 5 m    ����   6 n      7 8 7 1    ��
�� 
min  8 o    ���� 0 	yearstart 	yearStart 4  9 : 9 r    " ; < ; m    ����   < n      = > = m    !��
�� 
scnd > o    ���� 0 	yearstart 	yearStart :  ?�� ? L   # % @ @ o   # $���� 0 	yearstart 	yearStart��     A B A l     ��������  ��  ��   B  C D C i     E F E I      �� G���� 0 create_quarter   G  H�� H o      ���� 0 thedate theDate��  ��   F k     # I I  J K J r      L M L I     �� N���� 0 get_nearest_thursday   N  O�� O o    ���� 0 thedate theDate��  ��   M o      ���� 0 thethursday theThursday K  P Q P r   	  R S R c   	  T U T n   	  V W V m   
 ��
�� 
mnth W o   	 
���� 0 thethursday theThursday U m    ��
�� 
nmbr S o      ���� 
0 _month   Q  X Y X r      Z [ Z I   �� \ ]
�� .sysorondlong        doub \ l    ^���� ^ [     _ ` _ ^     a b a l    c���� c \     d e d o    ���� 
0 _month   e m    ���� ��  ��   b m    ����  ` m    ���� ��  ��   ] �� f��
�� 
dire f m    ��
�� olierndD��   [ o      ���� 0 quarter   Y  g�� g L   ! # h h o   ! "���� 0 quarter  ��   D  i j i l     ��������  ��  ��   j  k l k i     m n m I      �� o���� 0 get_nearest_thursday   o  p�� p o      ���� 0 thedate theDate��  ��   n k     ' q q  r s r l     t u v t s      w x w o     ���� 0 thedate theDate x o      ���� 0 thethursday theThursday u M G use copy to duplicate the variable, otherwise it's just the reference!    v � y y �   u s e   c o p y   t o   d u p l i c a t e   t h e   v a r i a b l e ,   o t h e r w i s e   i t ' s   j u s t   t h e   r e f e r e n c e ! s  z { z r     | } | c    
 ~  ~ n     � � � m    ��
�� 
wkdy � o    ���� 0 thethursday theThursday  m    	��
�� 
nmbr } o      ���� 0 twd   {  � � � Z     � ����� � =    � � � o    ���� 0 twd   � m    ����  � r     � � � m    ����  � o      ���� 0 twd  ��  ��   �  � � � r    $ � � � l   " ����� � [    " � � � o    ���� 0 thethursday theThursday � ]    ! � � � l    ����� � \     � � � m    ����  � o    ���� 0 twd  ��  ��   � m     ����  Q���  ��   � o      ���� 0 thethursday theThursday �  ��� � L   % ' � � o   % &���� 0 thethursday theThursday��   l  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 get_week_number   �  ��� � o      ���� 0 thedate theDate��  ��   � k     & � �  � � � l     �� � ���   � 3 - calculate week number for the given thursday    � � � � Z   c a l c u l a t e   w e e k   n u m b e r   f o r   t h e   g i v e n   t h u r s d a y �  � � � r      � � � I     �� ����� 0 get_nearest_thursday   �  ��� � o    ���� 0 thedate theDate��  ��   � o      ���� 0 thethursday theThursday �  � � � l  	 	�� � ���   � $  copy theThursday to yearStart    � � � � <   c o p y   t h e T h u r s d a y   t o   y e a r S t a r t �  � � � r   	  � � � I   	 �� ����� 0 
year_start   �  ��� � o   
 ���� 0 thethursday theThursday��  ��   � o      ���� 0 	yearstart 	yearStart �  � � � r    # � � � I   !�� � �
�� .sysorondlong        doub � l    ����� � ^     � � � l    ����� � [     � � � ^     � � � l    ����� � \     � � � o    ���� 0 thethursday theThursday � o    ���� 0 	yearstart 	yearStart��  ��   � m    ����  Q� � m    ���� ��  ��   � m    ���� ��  ��   � �� ���
�� 
dire � m    ��
�� olierndU��   � o      ���� 0 theweeknumber theWeekNumber �  ��� � L   $ & � � o   $ %���� 0 theweeknumber theWeekNumber��   �  � � � l     ��~�}�  �~  �}   �  � � � i     � � � I      �| ��{�| 0 quarter_indicator   �  ��z � o      �y�y 0 thedate theDate�z  �{   � k      � �  � � � r      � � � n      � � � 1    �x
�x 
year � o     �w�w 0 thedate theDate � o      �v�v 	0 _year   �  � � � r     � � � I    �u ��t�u 0 create_quarter   �  ��s � o    �r�r 0 thedate theDate�s  �t   � o      �q�q 0 _quarter   �  ��p � L     � � b     � � � b     � � � l    ��o�n � o    �m�m 	0 _year  �o  �n   � m     � � � � �  Q � l    ��l�k � o    �j�j 0 _quarter  �l  �k  �p   �  � � � l     �i�h�g�i  �h  �g   �  � � � i     � � � I      �f ��e�f 0 format00   �  ��d � o      �c�c 0 	thenumber 	theNumber�d  �e   � L      � � l     ��b�a � n      � � � 7   �` � �
�` 
ctxt � m    	�_�_�� � m   
 �^�^�� � l     ��]�\ � b      � � � m      � � � � �  0 0 � o    �[�[ 0 	thenumber 	theNumber�]  �\  �b  �a   �  � � � l     �Z�Y�X�Z  �Y  �X   �  �  � i     I      �W�V�W 0 week_indicator   �U o      �T�T 0 thedate theDate�U  �V   k       r     	 n     

 1    �S
�S 
year o     �R�R 0 thedate theDate	 o      �Q�Q 	0 _year    r     I    �P�O�P 0 get_week_number   �N o    �M�M 0 thedate theDate�N  �O   o      �L�L 	0 _week   �K l    L     b     b     l   �J�I o    �H�H 	0 _year  �J  �I   m     �  W I    �G�F�G 0 format00   �E o    �D�D 	0 _week  �E  �F   - ' create a string with the leading zeros    �   N   c r e a t e   a   s t r i n g   w i t h   t h e   l e a d i n g   z e r o s�K    !"! l     �C�B�A�C  �B  �A  " #$# i    %&% I      �@'�?�@ 0 day_formatter  ' ()( o      �>�> 0 thedate theDate) *�=* o      �<�< 0 _sep  �=  �?  & k     2++ ,-, r     ./. n     010 1    �;
�; 
year1 o     �:�: 0 thedate theDate/ o      �9�9 	0 _year  - 232 r    454 c    676 n    	898 m    	�8
�8 
mnth9 o    �7�7 0 thedate theDate7 m   	 
�6
�6 
nmbr5 o      �5�5 
0 _month  3 :;: r    <=< c    >?> n    @A@ 1    �4
�4 
day A o    �3�3 0 thedate theDate? m    �2
�2 
nmbr= o      �1�1 0 _day  ; BCB l   �0�/�.�0  �/  �.  C DED r    FGF I    �-H�,�- 0 format00  H I�+I o    �*�* 
0 _month  �+  �,  G o      �)�) 0 _ms  E JKJ r    'LML I    %�(N�'�( 0 format00  N O�&O o     !�%�% 0 _day  �&  �'  M o      �$�$ 0 _ds  K P�#P L   ( 2QQ l  ( 1R�"�!R b   ( 1STS b   ( /UVU b   ( -WXW b   ( +YZY l  ( )[� �[ o   ( )�� 	0 _year  �   �  Z o   ) *�� 0 _sep  X l  + ,\��\ o   + ,�� 0 _ms  �  �  V o   - .�� 0 _sep  T l  / 0]��] o   / 0�� 0 _ds  �  �  �"  �!  �#  $ ^_^ l     ����  �  �  _ `a` i     #bcb I      �d�� 0 day_indicator  d e�e o      �� 0 thedate theDate�  �  c L     ff I     �g�� 0 day_formatter  g hih o    �� 0 thedate theDatei j�j m    kk �ll  �  �  a mnm l     �
�	��
  �	  �  n opo i   $ 'qrq I      �s�� 0 
day_string  s t�t o      �� 0 thedate theDate�  �  r L     uu I     �v�� 0 day_formatter  v wxw o    �� 0 thedate theDatex y� y m    zz �{{  -�   �  p |}| l     ��������  ��  ��  } ~~ l     ��������  ��  ��   ��� i   ( +��� I      �������� 0 get_date_input  ��  ��  � k     u�� ��� r     ��� I    ������
�� .misccurdldt    ��� null��  ��  � o      ���� 0 
todaysdate 
todaysDate� ��� l   ��������  ��  ��  � ��� r    ��� c    ��� n    ��� 1   	 ��
�� 
day � o    	���� 0 
todaysdate 
todaysDate� m    ��
�� 
nmbr� o      ���� 0 	_todayday 	_todayDay� ��� r    ��� c    ��� n    ��� m    ��
�� 
mnth� o    ���� 0 
todaysdate 
todaysDate� m    ��
�� 
nmbr� o      ���� 0 _todaymonth _todayMonth� ��� r    ��� c    ��� n    ��� 1    ��
�� 
year� o    ���� 0 
todaysdate 
todaysDate� m    ��
�� 
nmbr� o      ���� 0 
_todayyear 
_todayYear� ��� l     ��������  ��  ��  � ��� r     1��� l    /������ b     /��� b     +��� b     )��� b     %��� l    #������ c     #��� o     !���� 0 
_todayyear 
_todayYear� m   ! "��
�� 
TEXT��  ��  � m   # $�� ���  -� l  % (������ c   % (��� o   % &���� 0 _todaymonth _todayMonth� m   & '��
�� 
TEXT��  ��  � m   ) *�� ���  -� l  + .������ c   + .��� o   + ,���� 0 	_todayday 	_todayDay� m   , -��
�� 
TEXT��  ��  ��  ��  � o      ���� 0 _todaystring _todayString� ��� l  2 2��������  ��  ��  � ��� I  2 C����
�� .sysodlogaskr        TEXT� b   2 ;��� b   2 9��� b   2 7��� b   2 5��� m   2 3�� ��� 0 W h a t   i s   t h e   t a r g e t   d a t e ?� o   3 4��
�� 
ret � o   5 6��
�� 
ret � m   7 8�� ��� " f o r m a t   Y Y Y Y - M M - D D� o   9 :��
�� 
ret � ����
�� 
dtxt� o   < =���� 0 _todaystring _todayString� �����
�� 
appr� m   > ?�� ���  T a r g e t   d a t e��  � ��� r   D M��� l  D K������ l  D K������ n   D K��� 1   G K��
�� 
ttxt� l  D G������ 1   D G��
�� 
rslt��  ��  ��  ��  ��  ��  � o      ���� 0 duedate dueDate� ��� l  N N��������  ��  ��  � ��� r   N Q��� o   N O���� 0 
todaysdate 
todaysDate� o      ���� 0 taskduedate taskDueDate� ��� r   R \��� n   R X��� 4   S X���
�� 
cwor� m   V W���� � o   R S���� 0 duedate dueDate� l     ������ n      ��� 1   Y [��
�� 
year� o   X Y���� 0 taskduedate taskDueDate��  ��  � ��� r   ] g��� n   ] c��� 4   ^ c���
�� 
cwor� m   a b���� � o   ] ^���� 0 duedate dueDate� l     ������ n      ��� m   d f��
�� 
mnth� o   c d���� 0 taskduedate taskDueDate��  ��  � ��� r   h r��� n   h n��� 4   i n���
�� 
cwor� m   l m���� � o   h i���� 0 duedate dueDate� l      ����  n       1   o q��
�� 
day  o   n o���� 0 taskduedate taskDueDate��  ��  �  l  s s��������  ��  ��   �� L   s u o   s t���� 0 taskduedate taskDueDate��  �  l     ��������  ��  ��   	
	 l      ����  on ui_date_input()		set theApp to path to frontmost application as text		if not (current application's NSThread's isMainThread()) as boolean then		display alert "This script must be run from the main thread." buttons {"Cancel"} as critical		error number -128	end if	-- create a view	set theView to current application's NSView's alloc()'s initWithFrame:(current application's NSMakeRect(0, 0, 100, 200))	-- create date picker	set datePicker to current application's NSDatePicker's alloc()'s initWithFrame:(current application's NSMakeRect(0, 0, 100, 100))	-- set style: choices are NSTextFieldAndStepperDatePickerStyle, NSClockAndCalendarDatePickerStyle, or NSTextFieldDatePickerStyle	datePicker's setDatePickerStyle:(current application's NSClockAndCalendarDatePickerStyle)	-- set elements: choices include NSHourMinuteDatePickerElementFlag, NSHourMinuteSecondDatePickerElementFlag, NSTimeZoneDatePickerElementFlag, NSYearMonthDatePickerElementFlag, and NSEraDatePickerElementFlag	datePicker's setDatePickerElements:((current application's NSYearMonthDayDatePickerElementFlag) + (current application's NSHourMinuteSecondDatePickerElementFlag as integer))	-- set initial date	datePicker's setDateValue:(current application's NSDate's |date|())	-- get the size it needs	set theSize to datePicker's fittingSize()	--resize the picker and view accordingly	theView's setFrameSize:theSize	datePicker's setFrameSize:theSize	-- add the picker to the view	theView's setSubviews:{datePicker}	-- create an alert	set theAlert to current application's NSAlert's alloc()'s init()	-- set up alert	tell theAlert		its setMessageText:"Pick a date"		its setInformativeText:"Any date"		its addButtonWithTitle:"OK"		its addButtonWithTitle:"Cancel"		its setAccessoryView:theView	end tell		-- show alert in modal loop	set returnCode to theAlert's runModal()	if returnCode = (current application's NSAlertSecondButtonReturn) then error number -128	-- retrieve date	set theDate to datePicker's dateValue() as date		return theDateend ui_date_input
    �$  o n   u i _ d a t e _ i n p u t ( )  	  	 s e t   t h e A p p   t o   p a t h   t o   f r o n t m o s t   a p p l i c a t i o n   a s   t e x t  	  	 i f   n o t   ( c u r r e n t   a p p l i c a t i o n ' s   N S T h r e a d ' s   i s M a i n T h r e a d ( ) )   a s   b o o l e a n   t h e n  	 	 d i s p l a y   a l e r t   " T h i s   s c r i p t   m u s t   b e   r u n   f r o m   t h e   m a i n   t h r e a d . "   b u t t o n s   { " C a n c e l " }   a s   c r i t i c a l  	 	 e r r o r   n u m b e r   - 1 2 8  	 e n d   i f  	 - -   c r e a t e   a   v i e w  	 s e t   t h e V i e w   t o   c u r r e n t   a p p l i c a t i o n ' s   N S V i e w ' s   a l l o c ( ) ' s   i n i t W i t h F r a m e : ( c u r r e n t   a p p l i c a t i o n ' s   N S M a k e R e c t ( 0 ,   0 ,   1 0 0 ,   2 0 0 ) )  	 - -   c r e a t e   d a t e   p i c k e r  	 s e t   d a t e P i c k e r   t o   c u r r e n t   a p p l i c a t i o n ' s   N S D a t e P i c k e r ' s   a l l o c ( ) ' s   i n i t W i t h F r a m e : ( c u r r e n t   a p p l i c a t i o n ' s   N S M a k e R e c t ( 0 ,   0 ,   1 0 0 ,   1 0 0 ) )  	 - -   s e t   s t y l e :   c h o i c e s   a r e   N S T e x t F i e l d A n d S t e p p e r D a t e P i c k e r S t y l e ,   N S C l o c k A n d C a l e n d a r D a t e P i c k e r S t y l e ,   o r   N S T e x t F i e l d D a t e P i c k e r S t y l e  	 d a t e P i c k e r ' s   s e t D a t e P i c k e r S t y l e : ( c u r r e n t   a p p l i c a t i o n ' s   N S C l o c k A n d C a l e n d a r D a t e P i c k e r S t y l e )  	 - -   s e t   e l e m e n t s :   c h o i c e s   i n c l u d e   N S H o u r M i n u t e D a t e P i c k e r E l e m e n t F l a g ,   N S H o u r M i n u t e S e c o n d D a t e P i c k e r E l e m e n t F l a g ,   N S T i m e Z o n e D a t e P i c k e r E l e m e n t F l a g ,   N S Y e a r M o n t h D a t e P i c k e r E l e m e n t F l a g ,   a n d   N S E r a D a t e P i c k e r E l e m e n t F l a g  	 d a t e P i c k e r ' s   s e t D a t e P i c k e r E l e m e n t s : ( ( c u r r e n t   a p p l i c a t i o n ' s   N S Y e a r M o n t h D a y D a t e P i c k e r E l e m e n t F l a g )   +   ( c u r r e n t   a p p l i c a t i o n ' s   N S H o u r M i n u t e S e c o n d D a t e P i c k e r E l e m e n t F l a g   a s   i n t e g e r ) )  	 - -   s e t   i n i t i a l   d a t e  	 d a t e P i c k e r ' s   s e t D a t e V a l u e : ( c u r r e n t   a p p l i c a t i o n ' s   N S D a t e ' s   | d a t e | ( ) )  	 - -   g e t   t h e   s i z e   i t   n e e d s  	 s e t   t h e S i z e   t o   d a t e P i c k e r ' s   f i t t i n g S i z e ( )  	 - - r e s i z e   t h e   p i c k e r   a n d   v i e w   a c c o r d i n g l y  	 t h e V i e w ' s   s e t F r a m e S i z e : t h e S i z e  	 d a t e P i c k e r ' s   s e t F r a m e S i z e : t h e S i z e  	 - -   a d d   t h e   p i c k e r   t o   t h e   v i e w  	 t h e V i e w ' s   s e t S u b v i e w s : { d a t e P i c k e r }  	 - -   c r e a t e   a n   a l e r t  	 s e t   t h e A l e r t   t o   c u r r e n t   a p p l i c a t i o n ' s   N S A l e r t ' s   a l l o c ( ) ' s   i n i t ( )  	 - -   s e t   u p   a l e r t  	 t e l l   t h e A l e r t  	 	 i t s   s e t M e s s a g e T e x t : " P i c k   a   d a t e "  	 	 i t s   s e t I n f o r m a t i v e T e x t : " A n y   d a t e "  	 	 i t s   a d d B u t t o n W i t h T i t l e : " O K "  	 	 i t s   a d d B u t t o n W i t h T i t l e : " C a n c e l "  	 	 i t s   s e t A c c e s s o r y V i e w : t h e V i e w  	 e n d   t e l l  	  	 - -   s h o w   a l e r t   i n   m o d a l   l o o p  	 s e t   r e t u r n C o d e   t o   t h e A l e r t ' s   r u n M o d a l ( )  	 i f   r e t u r n C o d e   =   ( c u r r e n t   a p p l i c a t i o n ' s   N S A l e r t S e c o n d B u t t o n R e t u r n )   t h e n   e r r o r   n u m b e r   - 1 2 8  	 - -   r e t r i e v e   d a t e  	 s e t   t h e D a t e   t o   d a t e P i c k e r ' s   d a t e V a l u e ( )   a s   d a t e  	  	 r e t u r n   t h e D a t e  e n d   u i _ d a t e _ i n p u t 

  l      ����  
	Some test cases for debugging purposes

set _testDate to date ("01-01-2023")set ntd to get_nearest_thursday(_testDate)if (ntd as string) is not "Thursday, 29 December 2022 at 00:00:00" then	display dialog "Testcase error: " & (_testDate as string) & " " & ntd as stringend ifset _testDate to date ("04-01-2023") -- january 4th should always be part of week 1set _wn to get_week_number(_testDate)if _wn is not 1 then	display dialog "Testcas error: " & (_testDate as string) & " " & _wn as stringend if    � 
 	 S o m e   t e s t   c a s e s   f o r   d e b u g g i n g   p u r p o s e s 
 
  s e t   _ t e s t D a t e   t o   d a t e   ( " 0 1 - 0 1 - 2 0 2 3 " )  s e t   n t d   t o   g e t _ n e a r e s t _ t h u r s d a y ( _ t e s t D a t e )  i f   ( n t d   a s   s t r i n g )   i s   n o t   " T h u r s d a y ,   2 9   D e c e m b e r   2 0 2 2   a t   0 0 : 0 0 : 0 0 "   t h e n  	 d i s p l a y   d i a l o g   " T e s t c a s e   e r r o r :   "   &   ( _ t e s t D a t e   a s   s t r i n g )   &   "   "   &   n t d   a s   s t r i n g  e n d   i f   s e t   _ t e s t D a t e   t o   d a t e   ( " 0 4 - 0 1 - 2 0 2 3 " )   - -   j a n u a r y   4 t h   s h o u l d   a l w a y s   b e   p a r t   o f   w e e k   1  s e t   _ w n   t o   g e t _ w e e k _ n u m b e r ( _ t e s t D a t e )  i f   _ w n   i s   n o t   1   t h e n  	 d i s p l a y   d i a l o g   " T e s t c a s   e r r o r :   "   &   ( _ t e s t D a t e   a s   s t r i n g )   &   "   "   &   _ w n   a s   s t r i n g  e n d   i f   l      ����   # 

Actual script starts here

    � : 
 
 A c t u a l   s c r i p t   s t a r t s   h e r e 
 
  l     ��������  ��  ��    l     ��������  ��  ��    l    ���� r       l    	!����! e     	"" I    	��#$
�� .earsffdralis        afdr# m     ��
�� afdrasup$ ��%&
�� 
from% m    ��
�� fldmfldu& ��'��
�� 
rtyp' m    ��
�� 
ctxt��  ��  ��    o      ���� 0 app_support  ��  ��   ()( l     ��*+��  * %  set targetDate to current date   + �,, >   s e t   t a r g e t D a t e   t o   c u r r e n t   d a t e) -.- l     ��/0��  / - ' here ask the user for the desired date   0 �11 N   h e r e   a s k   t h e   u s e r   f o r   t h e   d e s i r e d   d a t e. 232 l   4����4 r    565 I    �������� 0 get_date_input  ��  ��  6 o      �� 0 
targetdate 
targetDate��  ��  3 787 l     �~9:�~  9 ( " set targetDate to ui_date_input()   : �;; D   s e t   t a r g e t D a t e   t o   u i _ d a t e _ i n p u t ( )8 <=< l     �}�|�{�}  �|  �{  = >?> l   @�z�y@ r    ABA I    �xC�w�x 0 quarter_indicator  C D�vD o    �u�u 0 
targetdate 
targetDate�v  �w  B o      �t�t 0 qt  �z  �y  ? EFE l   %G�s�rG r    %HIH I    #�qJ�p�q 0 week_indicator  J K�oK o    �n�n 0 
targetdate 
targetDate�o  �p  I o      �m�m 0 wk  �s  �r  F LML l  & .N�l�kN r   & .OPO I   & ,�jQ�i�j 0 day_indicator  Q R�hR o   ' (�g�g 0 
targetdate 
targetDate�h  �i  P o      �f�f 0 dt  �l  �k  M STS l  / 9U�e�dU r   / 9VWV I   / 5�cX�b�c 0 
day_string  X Y�aY o   0 1�`�` 0 
targetdate 
targetDate�a  �b  W o      �_�_ 0 ds  �e  �d  T Z[Z l     �^\]�^  \ K E now start looking at the DEVONthink application and check the groups   ] �^^ �   n o w   s t a r t   l o o k i n g   a t   t h e   D E V O N t h i n k   a p p l i c a t i o n   a n d   c h e c k   t h e   g r o u p s[ _`_ l  :a�]�\a O   :bcb k   Hdd efe Z  H _gh�[�Zg H   H Rii l  H Qj�Y�Xj I  H Q�Wk�V
�W .coredoexbool       obj k 1   H M�U
�U 
DTcu�V  �Y  �X  h R   U [�Tl�S
�T .ascrerr ****      � ****l m   W Zmm �nn   N o   d a t a b a s e   o p e n�S  �[  �Z  f o�Ro O   `pqp Q   hrstr k   k�uu vwv r   k txyx l  k pz�Q�Pz b   k p{|{ m   k n}} �~~  /| o   n o�O�O 0 qt  �Q  �P  y o      �N�N 0 quarterlabel quarterLabelw � r   u ���� I  u |�M��L
�M .DTpacd23DTrc       utxt� o   u x�K�K 0 quarterlabel quarterLabel�L  � o      �J�J 0 quartergroup quarterGroup� ��� Z   � ����I�H� G   � ���� =  � ���� o   � ��G�G 0 quartergroup quarterGroup� m   � ��F
�F 
msng� l  � ���E�D� >  � ���� n   � ���� 1   � ��C
�C 
DTty� o   � ��B�B 0 quartergroup quarterGroup� m   � ��A
�A DtypDTgr�E  �D  � k   � ��� ��� l  � ��@���@  � 5 / the rootGroup does not exist, go and create it   � ��� ^   t h e   r o o t G r o u p   d o e s   n o t   e x i s t ,   g o   a n d   c r e a t e   i t� ��?� r   � ���� I  � ��>��=
�> .DTpacd52DTrc       utxt� o   � ��<�< 0 quarterlabel quarterLabel�=  � o      �;�; 0 quartergroup quarterGroup�?  �I  �H  � ��� l  � ��:���:  � > 8 now we have the quarter for sure, create the week group   � ��� p   n o w   w e   h a v e   t h e   q u a r t e r   f o r   s u r e ,   c r e a t e   t h e   w e e k   g r o u p� ��� r   � ���� l  � ���9�8� c   � ���� o   � ��7�7 0 wk  � m   � ��6
�6 
ctxt�9  �8  � o      �5�5 0 	weeklabel 	weekLabel� ��� r   � ���� l  � ���4�3� b   � ���� b   � ���� o   � ��2�2 0 quarterlabel quarterLabel� m   � ��� ���  /� o   � ��1�1 0 	weeklabel 	weekLabel�4  �3  � o      �0�0 
0 target  � ��� r   � ���� I  � ��/��.
�/ .DTpacd23DTrc       utxt� l  � ���-�,� o   � ��+�+ 
0 target  �-  �,  �.  � o      �*�* 0 	weekgroup 	weekGroup� ��� Z   �L���)�(� G   � ���� =  � ���� o   � ��'�' 0 	weekgroup 	weekGroup� m   � ��&
�& 
msng� l  � ���%�$� >  � ���� n   � ���� 1   � ��#
�# 
DTty� o   � ��"�" 0 	weekgroup 	weekGroup� m   � ��!
�! DtypDTgr�%  �$  � k   �H�� ��� r   � ���� l  � ��� �� b   � ���� o   � ��� 0 app_support  � m   � ��� ��� � D E V O N t h i n k   3 : T e m p l a t e s . n o i n d e x : A g i l e : W e e k   A h e a d . d t T e m p l a t e : E n g l i s h . l p r o j : Y Y Y Y W : W e e k l y   R e s u l t s . h t m l�   �  � o      �� 0 	_pathname 	_pathName� ��� r   ���� I  ����
� .DTpacd08DTrc       reco� K   ��� ���
� 
pnam� o   � ��� 0 	weeklabel 	weekLabel� ���
� 
DTty� m   �
� DtypDTgr�  � ���
� 
DTin� o  �� 0 quartergroup quarterGroup�  � o      �� 0 	weekgroup 	weekGroup� ��� r   ��� K  �� ���� 	0 YYYYW  � o  �� 0 	weeklabel 	weekLabel�  � o      �� $0 _theplaceholders _thePlaceHolders� ��� r  !8��� I !4���
� .DTpacd01DTrc       utxt� o  !$�� 0 	_pathname 	_pathName� ���
� 
DTph� o  '*�� $0 _theplaceholders _thePlaceHolders� �
��	
�
 
DTto� o  -0�� 0 	weekgroup 	weekGroup�	  � o      �� 0 	newrecord 	newRecord� ��� r  9H��� b  9@��� m  9<�� ��� " W e e k l y   R e s u l t s   -  � o  <?�� 0 	weeklabel 	weekLabel� n      ��� 1  CG�
� 
pnam� o  @C�� 0 	newrecord 	newRecord�  �)  �(  � ��� l MM����  � 9 3 now create the target record if it does not exist    � ��� f   n o w   c r e a t e   t h e   t a r g e t   r e c o r d   i f   i t   d o e s   n o t   e x i s t  � ��� r  MT��� l MP��� � c  MP��� o  MN���� 0 dt  � m  NO��
�� 
ctxt�  �   � o      ���� 0 daylabel dayLabel� ��� r  Ul   l Uh���� b  Uh b  Ud b  U` b  U\	
	 o  UX���� 0 quarterlabel quarterLabel
 m  X[ �  / o  \_���� 0 	weeklabel 	weekLabel m  `c �  / o  dg���� 0 daylabel dayLabel��  ��   o      ���� 
0 target  �  r  mx I mt����
�� .DTpacd23DTrc       utxt l mp���� o  mp���� 
0 target  ��  ��  ��   o      ���� 0 daygroup dayGroup �� Z  y����� G  y� = y� o  y|���� 0 daygroup dayGroup m  |��
�� 
msng l ������ > �� n  ��  1  ����
�� 
DTty  o  ������ 0 daygroup dayGroup m  ����
�� DtypDTgr��  ��   k  ��!! "#" r  ��$%$ l ��&����& c  ��'(' o  ������ 0 ds  ( m  ����
�� 
ctxt��  ��  % o      ���� 0 	daystring 	dayString# )*) r  ��+,+ l ��-����- b  ��./. o  ������ 0 app_support  / m  ��00 �11 � D E V O N t h i n k   3 : T e m p l a t e s . n o i n d e x : A g i l e : W e e k   A h e a d . d t T e m p l a t e : E n g l i s h . l p r o j : Y Y Y Y W : D 1 : D a i l y   R e s u l t s . h t m l��  ��  , o      ���� 0 	_pathname 	_pathName* 232 r  ��454 I ����67
�� .DTpacd08DTrc       reco6 K  ��88 ��9:
�� 
pnam9 o  ������ 0 daylabel dayLabel: ��;��
�� 
DTty; m  ����
�� DtypDTgr��  7 ��<��
�� 
DTin< o  ������ 0 	weekgroup 	weekGroup��  5 o      ���� 0 daygroup dayGroup3 =>= r  ��?@? K  ��AA ��B���� 0 
YYYY-MM-DD  B o  ������ 0 	daystring 	dayString��  @ o      ���� $0 _theplaceholders _thePlaceHolders> CDC r  ��EFE I ����GH
�� .DTpacd01DTrc       utxtG o  ������ 0 	_pathname 	_pathNameH ��IJ
�� 
DTphI o  ������ $0 _theplaceholders _thePlaceHoldersJ ��K��
�� 
DTtoK o  ������ 0 daygroup dayGroup��  F o      ���� 0 	newrecord 	newRecordD L��L r  ��MNM b  ��OPO m  ��QQ �RR   D a i l y   R e s u l t s   -  P o  ������ 0 	daystring 	dayStringN n      STS 1  ����
�� 
pnamT o  ������ 0 	newrecord 	newRecord��  ��  ��  ��  s R      ��U��
�� .ascrerr ****      � ****U o      ���� 0 errmsg errMSg��  t I ��V��
�� .sysodlogaskr        TEXTV b  WXW m  	YY �ZZ  E R R O R :  X o  	
���� 0 errmsg errMSg��  q 1   ` e��
�� 
DTcu�R  c 5   : E��[��
�� 
capp[ m   > A\\ �]]  D N t p
�� kfrmID  �]  �\  ` ^��^ l     ��������  ��  ��  ��       ��_`abcdefghijk��  _ �������������������������� 0 
year_start  �� 0 create_quarter  �� 0 get_nearest_thursday  �� 0 get_week_number  �� 0 quarter_indicator  �� 0 format00  �� 0 week_indicator  �� 0 day_formatter  �� 0 day_indicator  �� 0 
day_string  �� 0 get_date_input  
�� .aevtoappnull  �   � ****` �� ����lm���� 0 
year_start  �� ��n�� n  ���� 0 thedate theDate��  l ������ 0 thedate theDate�� 0 	yearstart 	yearStartm ������������
�� 
jan 
�� 
mnth
�� 
day 
�� 
hour
�� 
min 
�� 
scnd�� &�EQ�O��,FOk��,FOj��,FOj��,FOj��,FO�a �� F����op���� 0 create_quarter  �� ��q�� q  ���� 0 thedate theDate��  o ���������� 0 thedate theDate�� 0 thethursday theThursday�� 
0 _month  �� 0 quarter  p �������������� 0 get_nearest_thursday  
�� 
mnth
�� 
nmbr
�� 
dire
�� olierndD
�� .sysorondlong        doub�� $*�k+  E�O��,�&E�O�km!k��l E�O�b �� n����rs���� 0 get_nearest_thursday  �� ��t�� t  ���� 0 thedate theDate��  r �������� 0 thedate theDate�� 0 thethursday theThursday�� 0 twd  s ��������~
�� 
wkdy
�� 
nmbr�� � �~  Q��� (�EQ�O��,�&E�O�k  �E�Y hO��� E�O�c �} ��|�{uv�z�} 0 get_week_number  �| �yw�y w  �x�x 0 thedate theDate�{  u �w�v�u�t�w 0 thedate theDate�v 0 thethursday theThursday�u 0 	yearstart 	yearStart�t 0 theweeknumber theWeekNumberv �s�r�q�p�o�n�m�s 0 get_nearest_thursday  �r 0 
year_start  �q  Q��p 
�o 
dire
�n olierndU
�m .sysorondlong        doub�z '*�k+  E�O*�k+ E�O���!k�!��l E�O�d �l ��k�jxy�i�l 0 quarter_indicator  �k �hz�h z  �g�g 0 thedate theDate�j  x �f�e�d�f 0 thedate theDate�e 	0 _year  �d 0 _quarter  y �c�b �
�c 
year�b 0 create_quarter  �i ��,E�O*�k+ E�O��%�%e �a ��`�_{|�^�a 0 format00  �` �]}�] }  �\�\ 0 	thenumber 	theNumber�_  { �[�[ 0 	thenumber 	theNumber|  ��Z�Y
�Z 
ctxt�Y���^ �%[�\[Z�\Zi2Ef �X�W�V~�U�X 0 week_indicator  �W �T��T �  �S�S 0 thedate theDate�V  ~ �R�Q�P�R 0 thedate theDate�Q 	0 _year  �P 	0 _week   �O�N�M
�O 
year�N 0 get_week_number  �M 0 format00  �U ��,E�O*�k+ E�O��%*�k+ %g �L&�K�J���I�L 0 day_formatter  �K �H��H �  �G�F�G 0 thedate theDate�F 0 _sep  �J  � �E�D�C�B�A�@�?�E 0 thedate theDate�D 0 _sep  �C 	0 _year  �B 
0 _month  �A 0 _day  �@ 0 _ms  �? 0 _ds  � �>�=�<�;�:
�> 
year
�= 
mnth
�< 
nmbr
�; 
day �: 0 format00  �I 3��,E�O��,�&E�O��,�&E�O*�k+ E�O*�k+ E�O��%�%�%�%h �9c�8�7���6�9 0 day_indicator  �8 �5��5 �  �4�4 0 thedate theDate�7  � �3�3 0 thedate theDate� k�2�2 0 day_formatter  �6 	*��l+ i �1r�0�/���.�1 0 
day_string  �0 �-��- �  �,�, 0 thedate theDate�/  � �+�+ 0 thedate theDate� z�*�* 0 day_formatter  �. 	*��l+ j �)��(�'���&�) 0 get_date_input  �(  �'  � �%�$�#�"�!� ��% 0 
todaysdate 
todaysDate�$ 0 	_todayday 	_todayDay�# 0 _todaymonth _todayMonth�" 0 
_todayyear 
_todayYear�! 0 _todaystring _todayString�  0 duedate dueDate� 0 taskduedate taskDueDate� �������������������
� .misccurdldt    ��� null
� 
day 
� 
nmbr
� 
mnth
� 
year
� 
TEXT
� 
ret 
� 
dtxt
� 
appr� 
� .sysodlogaskr        TEXT
� 
rslt
� 
ttxt
� 
cwor�& v*j  E�O��,�&E�O��,�&E�O��,�&E�O��&�%��&%�%��&%E�O��%�%�%�%���� O_ a ,E�O�E�O�a k/��,FO�a l/��,FO�a m/��,FO�k �������
� .aevtoappnull  �   � ****� k    �� �� 2�� >�� E�� L�� S�� _��  �  �  � �� 0 errmsg errMSg� =�
�	��������� ����������������\������m}���������������������������������������������������0��Q����Y��
�
 afdrasup
�	 
from
� fldmfldu
� 
rtyp
� 
ctxt� 
� .earsffdralis        afdr� 0 app_support  � 0 get_date_input  � 0 
targetdate 
targetDate�  0 quarter_indicator  �� 0 qt  �� 0 week_indicator  �� 0 wk  �� 0 day_indicator  �� 0 dt  �� 0 
day_string  �� 0 ds  
�� 
capp
�� kfrmID  
�� 
DTcu
�� .coredoexbool       obj �� 0 quarterlabel quarterLabel
�� .DTpacd23DTrc       utxt�� 0 quartergroup quarterGroup
�� 
msng
�� 
DTty
�� DtypDTgr
�� 
bool
�� .DTpacd52DTrc       utxt�� 0 	weeklabel 	weekLabel�� 
0 target  �� 0 	weekgroup 	weekGroup�� 0 	_pathname 	_pathName
�� 
pnam
�� 
DTin
�� .DTpacd08DTrc       reco�� 	0 YYYYW  �� $0 _theplaceholders _thePlaceHolders
�� 
DTph
�� 
DTto
�� .DTpacd01DTrc       utxt�� 0 	newrecord 	newRecord�� 0 daylabel dayLabel�� 0 daygroup dayGroup�� 0 	daystring 	dayString�� 0 
YYYY-MM-DD  �� 0 errmsg errMSg��  
�� .sysodlogaskr        TEXT������� E�O*j+ E�O*�k+ 
E�O*�k+ E�O*�k+ E�O*�k+ E` O)a a a 0�*a ,j  )ja Y hO*a ,��a �%E` O_ j E` O_ a  
 _ a ,a a & _ j  E` Y hO��&E` !O_ a "%_ !%E` #O_ #j E` $O_ $a  
 _ $a ,a a & `�a %%E` &Oa '_ !a a �a (_ l )E` $Oa *_ !lE` +O_ &a ,_ +a -_ $� .E` /Oa 0_ !%_ /a ',FY hO��&E` 1O_ a 2%_ !%a 3%_ 1%E` #O_ #j E` 4O_ 4a  
 _ 4a ,a a & j_ �&E` 5O�a 6%E` &Oa '_ 1a a �a (_ $l )E` 4Oa 7_ 5lE` +O_ &a ,_ +a -_ 4� .E` /Oa 8_ 5%_ /a ',FY hW X 9 :a ;�%j <UUascr  ��ޭ