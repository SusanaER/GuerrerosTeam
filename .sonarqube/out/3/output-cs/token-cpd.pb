ˇ
uC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\Autorizacion\IAuthorization.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,
Autorizacion, 8
{ 
public		 

	interface		 
IAuthorization		 #
{

 
} 
} ∫
qC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\DTO\UserDto\EditUserDto.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,
DTO, /
./ 0
UserDto0 7
{		 
public

 

class

 
EditUserDto

 
{ 
[ 	
EmailAddress	 
] 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Î
nC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\DTO\UserDto\LoginDto.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,
DTO, /
./ 0
UserDto0 7
{		 
public

 

class

 
LoginDto

 
{ 
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ∏
pC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\DTO\UserDto\NewUserDto.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,
DTO, /
./ 0
UserDto0 7
{		 
public

 

class

 

NewUserDto

 
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength (
=) *
$num+ ,
), -
]- .
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
EmailAddress	 
] 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} µ
mC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\DTO\UserDto\UserDto.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,
DTO, /
./ 0
UserDto0 7
{		 
public

 

class

 
UserDto

 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
EmailAddress	 
] 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
EmailAddress	 
] 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ù
gC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\MapperProfile.cs
	namespace 	

GymManager
 
. 
ApplicationServices (
{ 
public 

class 
MapperProfile 
:  
Profile! (
{ 
public 
MapperProfile 
( 
) 
{ 	
	CreateMap 
< 
IdentityUser "
," #
UserDto$ +
>+ ,
(, -
)- .
;. /
	CreateMap 
< 
IdentityUser "
," #

NewUserDto$ .
>. /
(/ 0
)0 1
;1 2
	CreateMap 
< 
IdentityUser "
," #
EditUserDto$ /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< 
UserDto 
, 
IdentityUser +
>+ ,
(, -
)- .
;. /
	CreateMap 
< 

NewUserDto  
,  !
IdentityUser" .
>. /
(/ 0
)0 1
;1 2
	CreateMap 
< 
EditUserDto !
,! "
IdentityUser# /
>/ 0
(0 1
)1 2
;2 3
} 	
} 
} ‹	
lC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\Users\IUserService.cs
	namespace		 	
GuerrerosTeam		
 
.		 
ApplicationServices		 +
.		+ ,
Users		, 1
{

 
public 

	interface 
IUserService !
{ 
Task 
< 
IEnumerable 
< 
UserDto  
>  !
>! "
GetUsersAsync# 0
(0 1
)1 2
;2 3
Task 
< 
UserDto 
> 
GetUserAsync "
(" #
string# )
id* ,
), -
;- .
Task 
< 
IdentityResult 
> 
AddUserAsync )
() *

NewUserDto* 4
userDto5 <
)< =
;= >
Task 
EditUserAsync 
( 
string !
id" $
,$ %
EditUserDto& 1
userDto2 9
)9 :
;: ;
Task 
DeleteUserAsync 
( 
string #
id$ &
)& '
;' (
} 
} ©3
kC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\Users\UserService.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,
Users, 1
{ 
public 

class 
UserService 
: 
IUserService +
{ 
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
VideogamesContext *
_context+ 3
;3 4
private 
readonly 
IMapper  
_mapper! (
;( )
public 
UserService 
( 
UserManager &
<& '
IdentityUser' 3
>3 4
userManager5 @
,@ A
VideogamesContextB S
contextT [
,[ \
IMapper] d
mappere k
)k l
{ 	
_userManager 
= 
userManager &
;& '
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
UserDto& -
>- .
>. /
GetUsersAsync0 =
(= >
)> ?
{ 	
List 
< 
IdentityUser 
> 
users $
=% &
await' ,
_userManager- 9
.9 :
Users: ?
.? @
ToListAsync@ K
(K L
)L M
;M N
List 
< 
UserDto 
> 
usersDto "
=# $
new% (
List) -
<- .
UserDto. 5
>5 6
(6 7
)7 8
;8 9
foreach!! 
(!! 
var!! 
user!! 
in!!  
users!!! &
)!!& '
{"" 
usersDto## 
.## 
Add## 
(## 
_mapper## $
.##$ %
Map##% (
<##( )
UserDto##) 0
>##0 1
(##1 2
user##2 6
)##6 7
)##7 8
;##8 9
}$$ 
return&& 
usersDto&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
UserDto)) !
>))! "
GetUserAsync))# /
())/ 0
string))0 6
id))7 9
)))9 :
{** 	
IdentityUser++ 
user++ 
=++ 
await++  %
_userManager++& 2
.++2 3
Users++3 8
.++8 9
Where++9 >
(++> ?
x++? @
=>++A C
x++D E
.++E F
Id++F H
==++I K
id++L N
)++N O
.++O P
FirstOrDefaultAsync++P c
(++c d
)++d e
;++e f
UserDto-- 
userDto-- 
=-- 
_mapper-- %
.--% &
Map--& )
<--) *
UserDto--* 1
>--1 2
(--2 3
user--3 7
)--7 8
;--8 9
return// 
userDto// 
;// 
}00 	
public22 
async22 
Task22 
<22 
IdentityResult22 (
>22( )
AddUserAsync22* 6
(226 7

NewUserDto227 A
userDto22B I
)22I J
{33 	
var44 
result44 
=44 
await44 
_userManager44 +
.44+ ,
CreateAsync44, 7
(447 8
new448 ;
IdentityUser44< H
{55 
Email66 
=66 
userDto66 
.66  
Email66  %
,66% &
EmailConfirmed77 
=77  
true77! %
,77% &
UserName88 
=88 
userDto88 "
.88" #
Email88# (
,88( )
PhoneNumber99 
=99 
userDto99 %
.99% &
PhoneNumber99& 1
}:: 
,:: 
userDto:: 
.:: 
Password:: 
)::  
;::  !
return<< 
result<< 
;<< 
}>> 	
public@@ 
async@@ 
Task@@ 
EditUserAsync@@ '
(@@' (
string@@( .
id@@/ 1
,@@1 2
EditUserDto@@3 >
userDto@@? F
)@@F G
{AA 	
varBB 
userBB 
=BB 
awaitBB 
_userManagerBB )
.BB) *
FindByIdAsyncBB* 7
(BB7 8
idBB8 :
)BB: ;
;BB; <
userCC 
.CC 
PhoneNumberCC 
=CC 
userDtoCC &
.CC& '
PhoneNumberCC' 2
;CC2 3
userDD 
.DD 
UserNameDD 
=DD 
userDtoDD #
.DD# $
UserNameDD$ ,
;DD, -
userEE 
.EE 
EmailEE 
=EE 
userDtoEE  
.EE  !
UserNameEE! )
;EE) *
	UserStoreFF 
<FF 
IdentityUserFF "
>FF" #
storeFF$ )
=FF* +
newFF, /
	UserStoreFF0 9
<FF9 :
IdentityUserFF: F
>FFF G
(FFG H
_contextFFH P
)FFP Q
;FFQ R
awaitLL 
storeLL 
.LL 
UpdateAsyncLL #
(LL# $
userLL$ (
)LL( )
;LL) *
}MM 	
publicOO 
asyncOO 
TaskOO 
DeleteUserAsyncOO )
(OO) *
stringOO* 0
idOO1 3
)OO3 4
{PP 	
varQQ 
userQQ 
=QQ 
awaitQQ 
_userManagerQQ )
.QQ) *
FindByIdAsyncQQ* 7
(QQ7 8
idQQ8 :
)QQ: ;
;QQ; <
	UserStoreSS 
<SS 
IdentityUserSS "
>SS" #
storeSS$ )
=SS* +
newSS, /
	UserStoreSS0 9
<SS9 :
IdentityUserSS: F
>SSF G
(SSG H
_contextSSH P
)SSP Q
;SSQ R
awaitTT 
storeTT 
.TT 
DeleteAsyncTT #
(TT# $
userTT$ (
)TT( )
;TT) *
}VV 	
}WW 
}XX ﬁ	
yC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\Videogames\IVideogameAppService.cs
	namespace 	
GuerrerosTeam
 
. 
ApplicationServices +
.+ ,

Videogames, 6
{		 
public

 

	interface

  
IVideogameAppService

 )
{ 
Task 
< 
List 
< 
	Videogame 
> 
> 
GetVideogameAsync /
(/ 0
)0 1
;1 2
Task 
< 
int 
> 
AddVideogameAsync #
(# $
	Videogame$ -
	videogame. 7
)7 8
;8 9
Task  
DeleteVideogameAsync !
(! "
int" %
videogameId& 1
)1 2
;2 3
Task 
< 
	Videogame 
> !
GetVideogameByIdAsync -
(- .
int. 1
videogameId2 =
)= >
;> ?
Task 
EditVideogameAsync 
(  
	Videogame  )
	videogame* 3
)3 4
;4 5
} 
} ø
xC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam.ApplicationServices\Videogames\VideogameAppService.cs
	namespace

 	
GuerrerosTeam


 
.

 
ApplicationServices

 +
.

+ ,

Videogames

, 6
{ 
public 

class 
VideogameAppService $
:$ % 
IVideogameAppService& :
{ 
private 
readonly 
IRepository $
<$ %
int% (
,( )
	Videogame* 3
>3 4
_repository5 @
;@ A
public 
VideogameAppService "
(" #
IRepository# .
<. /
int/ 2
,2 3
	Videogame4 =
>= >

repository? I
)I J
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
int 
> 
AddVideogameAsync 0
(0 1
	Videogame1 :
	videogame; D
)D E
{ 	
await 
_repository 
. 
AddAsync &
(& '
	videogame' 0
)0 1
;1 2
return 
	videogame 
. 
Id 
;  
} 	
public 
async 
Task  
DeleteVideogameAsync .
(. /
int/ 2
videogameId3 >
)> ?
{ 	
await 
_repository 
. 
DeleteAsync )
() *
videogameId* 5
)5 6
;6 7
} 	
public!! 
async!! 
Task!! 
EditVideogameAsync!! ,
(!!, -
	Videogame!!- 6
	videogame!!7 @
)!!@ A
{"" 	
await## 
_repository## 
.## 
UpdateAsync## )
(##) *
	videogame##* 3
)##3 4
;##4 5
}$$ 	
public&& 
async&& 
Task&& 
<&& 
List&& 
<&& 
	Videogame&& (
>&&( )
>&&) *
GetVideogameAsync&&+ <
(&&< =
)&&= >
{'' 	
return)) 
await)) 
_repository)) $
.))$ %
GetAll))% +
())+ ,
))), -
.))- .
ToListAsync)). 9
())9 :
))): ;
;)); <
}** 	
public,, 
async,, 
Task,, 
<,, 
	Videogame,, #
>,,# $!
GetVideogameByIdAsync,,% :
(,,: ;
int,,; >
videogameId,,? J
),,J K
{-- 	
return.. 
await.. 
_repository.. $
...$ %
GetAsync..% -
(..- .
videogameId... 9
)..9 :
;..: ;
}// 	
}00 
}11 