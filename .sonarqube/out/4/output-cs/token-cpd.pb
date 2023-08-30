„%
UC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Auth\JwtOptions.cs
	namespace 	
GuerrerosTeam
 
. 
Auth 
{ 
public 

	interface 
IJwtIssuerOptions &
{		 
String

 
Issuer

 
{

 
get

 
;

 
}

 
String 
Audience 
{ 
get 
; 
}  
TimeSpan 
ValidFor 
{ 
get 
;  
}! "
DateTime 
	NotBefore 
{ 
get  
;  !
}" #
DateTime 
IssuedAt 
{ 
get 
;  
}! "
DateTime 
Expires 
{ 
get 
; 
}  !
Task 
< 
String 
> 
JtiGenerator !
(! "
)" #
;# $
SigningCredentials 
SigningCredentials -
{. /
get0 3
;3 4
}5 6
} 
public 

class 
JwtIssuerFactory !
:" #
IJwtIssuerOptions$ 5
{ 
public 
String 
Issuer 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
String 
Audience 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
TimeSpan 
ValidFor  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
DateTime 
	NotBefore !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
DateTime 
IssuedAt  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
DateTime 
Expires 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
SigningCredentials !
SigningCredentials" 4
{5 6
get7 :
;: ;
private< C
setD G
;G H
}I J
public 
JwtIssuerFactory 
(  
IOptions  (
<( )&
JwtTokenValidationSettings) C
>C D
optionsE L
)L M
{   	
Issuer!! 
=!! 
options!! 
.!! 
Value!! "
.!!" #
ValidIssuer!!# .
;!!. /
Audience"" 
="" 
options"" 
."" 
Value"" $
.""$ %
ValidAudience""% 2
;""2 3
IssuedAt$$ 
=$$ 
DateTime$$ 
.$$  
UtcNow$$  &
;$$& '
	NotBefore%% 
=%% 
IssuedAt%%  
;%%  !
ValidFor'' 
='' 
TimeSpan'' 
.''  
FromMinutes''  +
(''+ ,
options'', 3
.''3 4
Value''4 9
.''9 :
Duration'': B
)''B C
;''C D
Expires(( 
=(( 
DateTime(( 
.(( 
UtcNow(( %
.((% &

AddMinutes((& 0
(((0 1
$num((1 3
)((3 4
;((4 5
var** 
key** 
=** 
new**  
SymmetricSecurityKey** .
(**. /
Encoding**/ 7
.**7 8
UTF8**8 <
.**< =
GetBytes**= E
(**E F
options**F M
.**M N
Value**N S
.**S T
	SecretKey**T ]
)**] ^
)**^ _
;**_ `
SigningCredentials++ 
=++  
new++! $
SigningCredentials++% 7
(++7 8
key++8 ;
,++; <
SecurityAlgorithms++= O
.++O P
Aes128CbcHmacSha256++P c
)++c d
;++d e
}-- 	
public.. 
async.. 
Task.. 
<.. 
String..  
>..  !
JtiGenerator.." .
(... /
)../ 0
{// 	
return00 
await00 
Task00 
.00 

FromResult00 (
(00( )
Guid00) -
.00- .
NewGuid00. 5
(005 6
)006 7
.007 8
ToString008 @
(00@ A
)00A B
)00B C
;00C D
}11 	
}22 
}33 ≠Q
nC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Controllers\Authorization\AuthController.cs
	namespace 	
GuerrerosTeam
 
. 
Controllers #
.# $
Authorization$ 1
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AuthController 
:  !
ControllerBase" 0
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
readonly 
SignInManager &
<& '
IdentityUser' 3
>3 4
_signInManager5 C
;C D
private 
readonly 
IJwtIssuerOptions *
_jwtOptions+ 6
;6 7
private 
readonly 
RoleManager $
<$ %
IdentityRole% 1
>1 2
_roleManager3 ?
;? @
private 
readonly 
IOptions !
<! "&
JwtTokenValidationSettings" <
>< =

_jwtConfig> H
;H I
public 
AuthController 
( 
UserManager )
<) *
IdentityUser* 6
>6 7
userManager8 C
,C D
SignInManager 
< 
IdentityUser &
>& '
signInManager( 5
,5 6
IJwtIssuerOptions 

jwtOptions (
,( )
RoleManager 
< 
IdentityRole $
>$ %
roleManager& 1
,1 2
IOptions 
< &
JwtTokenValidationSettings /
>/ 0
	jwtConfig1 :
): ;
{ 	
_userManager 
= 
userManager &
;& '
_signInManager 
= 
signInManager *
;* +
_jwtOptions 
= 

jwtOptions $
;$ %
_roleManager   
=   
roleManager   &
;  & '

_jwtConfig!! 
=!! 
	jwtConfig!! "
;!!" #
}"" 	
[$$ 	
HttpPost$$	 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Login%%) .
(%%. /

LoginModel%%/ 9
model%%: ?
)%%? @
{&& 	
if'' 
('' 
model'' 
=='' 
null'' 
)'' 
{(( 
return)) 

BadRequest)) !
())! "
$str))" :
))): ;
;)); <
}** 
var++ 
user++ 
=++ 
await++ 
_userManager++ )
.++) *
FindByEmailAsync++* :
(++: ;
model++; @
.++@ A
UserName++A I
)++I J
;++J K
if,, 
(,, 
user,, 
==,, 
null,, 
),, 
{-- 
return.. 
Unauthorized.. #
(..# $
)..$ %
;..% &
}// 
var00 
resuslt00 
=00 
await00 
_signInManager00  .
.00. /
PasswordSignInAsync00/ B
(00B C
user00C G
,00G H
model00I N
.00N O
Password00O W
,00W X
false00Y ^
,00^ _
false00` e
)00e f
;00f g
if11 
(11 
user11 
==11 
null11 
||11 
!11  !
(11! "
await11" '
_signInManager11( 6
.116 7
PasswordSignInAsync117 J
(11J K
user11K O
,11O P
model11Q V
.11V W
Password11W _
,11_ `
false11a f
,11f g
false11h m
)11m n
)11n o
.11o p
	Succeeded11p y
)11y z
return22 
Unauthorized22 #
(22# $
)22$ %
;22% &
var33 
tokenString33 
=33 
await33 #
CreateJwtTokenAsync33$ 7
(337 8
user338 <
)33< =
;33= >
var44 
result44 
=44 
new44 
ContentResult44 *
(44* +
)44+ ,
{44- .
Content44/ 6
=447 8
tokenString449 D
,44D E
ContentType44F Q
=44R S
$str44T f
}44g h
;44h i
return55 
result55 
;55 
}77 	
private99 
async99 
Task99 
<99 
String99 !
>99! "
CreateJwtTokenAsync99# 6
(996 7
IdentityUser997 C
user99D H
)99H I
{:: 	
var;; 
claims;; 
=;; 
new;; 
List;; !
<;;! "
Claim;;" '
>;;' (
(;;( )
new;;) ,
[;;, -
];;- .
{<< 
new== 
Claim== 
(== 
System==  
.==  !
IdentityModel==! .
.==. /
Tokens==/ 5
.==5 6
Jwt==6 9
.==9 :#
JwtRegisteredClaimNames==: Q
.==Q R
Iss==R U
,==U V
_jwtOptions==V a
.==a b
Issuer==b h
)==h i
,==i j
new?? 
Claim?? 
(?? 
System??  
.??  !
IdentityModel??! .
.??. /
Tokens??/ 5
.??5 6
Jwt??6 9
.??9 :#
JwtRegisteredClaimNames??: Q
.??Q R
Sub??R U
,??U V
user??V Z
.??Z [
UserName??[ c
)??c d
,??d e
newAA 
ClaimAA 
(AA 
SystemAA  
.AA  !
IdentityModelAA! .
.AA. /
TokensAA/ 5
.AA5 6
JwtAA6 9
.AA9 :#
JwtRegisteredClaimNamesAA: Q
.AAQ R
EmailAAR W
,AAW X
userAAX \
.AA\ ]
EmailAA] b
)AAb c
,AAc d
newCC 
ClaimCC 
(CC 
SystemCC  
.CC  !
IdentityModelCC! .
.CC. /
TokensCC/ 5
.CC5 6
JwtCC6 9
.CC9 :#
JwtRegisteredClaimNamesCC: Q
.CCQ R
JtiCCR U
,CCU V
awaitCCV [
_jwtOptionsCC\ g
.CCg h
JtiGeneratorCCh t
(CCt u
)CCu v
)CCv w
,CCw x
newEE 
ClaimEE 
(EE 
SystemEE  
.EE  !
IdentityModelEE! .
.EE. /
TokensEE/ 5
.EE5 6
JwtEE6 9
.EE9 :#
JwtRegisteredClaimNamesEE: Q
.EEQ R
IatEER U
,EEU V
_jwtOptionsEEV a
.EEa b
IssuedAtEEb j
.EEj k
ToUnixEpochDateEEk z
(EEz {
)EE{ |
.EE| }
ToString	EE} Ö
(
EEÖ Ü
)
EEÜ á
.
EEá à
ToString
EEà ê
(
EEê ë
)
EEë í
,
EEì î
ClaimValueTypes
EEï §
.
EE§ •
String
EE• ´
)
EE´ ¨
}FF 
)FF 
;FF 
claimsHH 
.HH 
AddRangeHH 
(HH 
awaitHH !
_userManagerHH" .
.HH. /
GetClaimsAsyncHH/ =
(HH= >
userHH> B
)HHB C
)HHC D
;HHD E
varJJ 
	roleNamesJJ 
=JJ 
awaitJJ !
_userManagerJJ" .
.JJ. /
GetRolesAsyncJJ/ <
(JJ< =
userJJ= A
)JJA B
;JJB C
foreachKK 
(KK 
varKK 
roleNameKK !
inKK" $
	roleNamesKK% .
)KK. /
{LL 
varMM 
roleMM 
=MM 
awaitMM  
_roleManagerMM! -
.MM- .
FindByNameAsyncMM. =
(MM= >
roleNameMM> F
)MMF G
;MMG H
ifNN 
(NN 
roleNN 
!=NN 
nullNN  
)NN  !
{OO 
varPP 
	roleClaimPP !
=PP" #
newPP$ '
ClaimPP( -
(PP- .

ClaimTypesPP. 8
.PP8 9
RolePP9 =
,PP= >
rolePP? C
.PPC D
NamePPD H
,PPH I
ClaimValueTypesPPJ Y
.PPY Z
StringPPZ `
,PP` a
_jwtOptionsPPb m
.PPm n
IssuerPPn t
)PPt u
;PPu v
claimsQQ 
.QQ 
AddQQ 
(QQ 
	roleClaimQQ (
)QQ( )
;QQ) *
varRR 

roleClaimsRR "
=RR# $
awaitRR% *
_roleManagerRR+ 7
.RR7 8
GetClaimsAsyncRR8 F
(RRF G
roleRRG K
)RRK L
;RRL M
claimsSS 
.SS 
AddRangeSS #
(SS# $

roleClaimsSS$ .
)SS. /
;SS/ 0
}TT 
}UU 
varVV 
jwtVV 
=VV 
newVV 
JwtSecurityTokenVV *
(VV* +
issuerWW 
:WW 
_jwtOptionsWW #
.WW# $
IssuerWW$ *
,WW* +
audienceXX 
:XX 
_jwtOptionsXX %
.XX% &
AudienceXX& .
,XX. /
claimsYY 
:YY 
claimsYY 
,YY 
	notBeforeZZ 
:ZZ 
_jwtOptionsZZ &
.ZZ& '
	NotBeforeZZ' 0
,ZZ0 1
expires[[ 
:[[ 
_jwtOptions[[ $
.[[$ %
Expires[[% ,
,[[, -
signingCredentials\\ "
:\\" #
_jwtOptions\\$ /
.\\/ 0
SigningCredentials\\0 B
)]] 
;]] 
var^^ 
result^^ 
=^^ 
new^^ #
JwtSecurityTokenHandler^^ 4
(^^4 5
)^^5 6
.^^6 7

WriteToken^^7 A
(^^A B
jwt^^B E
)^^E F
;^^F G
return__ 
result__ 
;__ 
}`` 	
}aa 
}bb ﬁ
`C:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Controllers\UserController.cs
	namespace 	
GuerrerosTeam
 
. 
Controllers #
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
UsersController 
( 
IUserService +
userService, 7
)7 8
{ 	
_userService 
= 
userService &
;& '
} 	
}
†† 
}°° ±
pC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Controllers\Videogames\VideogameController.cs
	namespace 	
GuerrerosTeam
 
. 
Controllers #
.# $

Videogames$ .
{ 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
VideogameController $
:% &
ControllerBase' 5
{ 
private 
readonly  
IVideogameAppService -
_videogameService. ?
;? @
public 
VideogameController "
(" # 
IVideogameAppService# 7
videogameService8 H
)H I
{ 	
_videogameService 
= 
videogameService  0
;0 1
} 	
[ 	
HttpGet	 
( 
) 
] 
public 
async 
Task 
< 
IEnumerable %
<% &
	Videogame& /
>/ 0
>0 1
GetAll2 8
(8 9
)9 :
{ 	
List 
< 
	Videogame 
> 

videogames &
=' (
await) .
_videogameService/ @
.@ A
GetVideogameAsyncA R
(R S
)S T
;T U
return 

videogames 
; 
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public   
async   
Task   
<   
	Videogame   #
>  # $
GetById  % ,
(  , -
int  - 0
id  1 3
)  3 4
{!! 	
	Videogame"" 
	videogame"" 
=""  !
await""" '
_videogameService""( 9
.""9 :!
GetVideogameByIdAsync"": O
(""O P
id""P R
)""R S
;""S T
return## 
	videogame## 
;## 
}$$ 	
['' 	
HttpPost''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
Int32(( 
>((  
Post((! %
(((% &
	Videogame((& /
entity((0 6
)((6 7
{)) 	
var** 
	videogame** 
=** 
await** !
_videogameService**" 3
.**3 4
AddVideogameAsync**4 E
(**E F
entity**F L
)**L M
;**M N
return++ 
	videogame++ 
;++ 
},, 	
[// 	
HttpPut//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
Put00 
(00 
int00 !
id00" $
,00$ %
	Videogame00& /
model000 5
)005 6
{11 	
model22 
.22 
Id22 
=22 
id22 
;22 
await33 
_videogameService33 #
.33# $
EditVideogameAsync33$ 6
(336 7
model337 <
)33< =
;33= >
}44 	
[66 	

HttpDelete66	 
(66 
$str66 
)66 
]66 
public77 
async77 
Task77 
Delete77  
(77  !
int77! $
id77% '
)77' (
{88 	
await99 
_videogameService99 #
.99# $ 
DeleteVideogameAsync99$ 8
(998 9
id999 ;
)99; <
;99< =
}:: 	
};; 
}<< ≈1
VC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\InitDbExtensions.cs
	namespace 	
GuerrerosTeam
 
{ 
public 

static 
class 
InitDbExtensions (
{ 
public 
static 
IApplicationBuilder )
InitDb* 0
(0 1
this1 5
IApplicationBuilder6 I
appJ M
)M N
{ 	
using		 
(		 
var		 
scope		 
=		 
app		 "
.		" #
ApplicationServices		# 6
.		6 7
CreateScope		7 B
(		B C
)		C D
)		D E
{

 
var 
services 
= 
scope $
.$ %
ServiceProvider% 4
;4 5
var 
userManager 
=  !
services" *
.* +

GetService+ 5
<5 6
UserManager6 A
<A B
IdentityUserB N
>N O
>O P
(P Q
)Q R
;R S
var 
roleManager 
=  !
services" *
.* +

GetService+ 5
<5 6
RoleManager6 A
<A B
IdentityRoleB N
>N O
>O P
(P Q
)Q R
;R S
if 
( 
userManager 
.  
Users  %
.% &
Count& +
(+ ,
), -
==. 0
$num1 2
)2 3
{ 
Task 
. 
Run 
( 
( 
) 
=>  "
	InitRoles# ,
(, -
roleManager- 8
)8 9
)9 :
.: ;
Wait; ?
(? @
)@ A
;A B
Task 
. 
Run 
( 
( 
) 
=>  "
	InitUsers# ,
(, -
userManager- 8
)8 9
)9 :
.: ;
Wait; ?
(? @
)@ A
;A B
} 
} 
return 
app 
; 
} 	
private 
static 
async 
Task !
	InitRoles" +
(+ ,
RoleManager, 7
<7 8
IdentityRole8 D
>D E
roleManagerF Q
)Q R
{ 	
try 
{ 
var 
role 
= 
new 
IdentityRole +
(+ ,
$str, 3
)3 4
;4 5
await 
roleManager !
.! "
CreateAsync" -
(- .
role. 2
)2 3
;3 4
role 
= 
new 
IdentityRole '
(' (
$str( .
). /
;/ 0
await 
roleManager !
.! "
CreateAsync" -
(- .
role. 2
)2 3
;3 4
role   
=   
new   
IdentityRole   '
(  ' (
$str  ( 4
)  4 5
;  5 6
await!! 
roleManager!! !
.!!! "
CreateAsync!!" -
(!!- .
role!!. 2
)!!2 3
;!!3 4
}"" 
catch## 
(## 
	Exception## 
ex## 
)##  
{$$ 
throw%% 
;%% 
}&& 
}'' 	
private(( 
static(( 
async(( 
Task(( !
	InitUsers((" +
(((+ ,
UserManager((, 7
<((7 8
IdentityUser((8 D
>((D E
userManager((F Q
)((Q R
{)) 	
var** 
admin** 
=** 
new** 
IdentityUser** (
(**( )
)**) *
{++ 
UserName,, 
=,, 
$str,, 0
,,,0 1
Email-- 
=-- 
$str-- -
,--- .
PhoneNumber.. 
=.. 
$str.. *
}// 
;// 
await00 
userManager00 
.00 
CreateAsync00 )
(00) *
admin00* /
,00/ 0
$str001 @
)00@ A
;00A B
await11 
userManager11 
.11 
AddToRoleAsync11 ,
(11, -
admin11- 2
,112 3
$str114 ;
)11; <
;11< =
var33 
user33 
=33 
new33 
IdentityUser33 '
(33' (
)33( )
{44 
UserName55 
=55 
$str55 /
,55/ 0
Email66 
=66 
$str66 ,
,66, -
PhoneNumber77 
=77 
$str77 *
}88 
;88 
await99 
userManager99 
.99 
CreateAsync99 )
(99) *
user99* .
,99. /
$str990 ?
)99? @
;99@ A
await:: 
userManager:: 
.:: 
AddToRoleAsync:: ,
(::, -
user::- 1
,::1 2
$str::3 9
)::9 :
;::: ;
};; 	
public== 
static== 
Int64== 
ToUnixEpochDate== +
(==+ ,
this==, 0
DateTime==1 9
dateTime==: B
)==B C
{>> 	
var?? 
result?? 
=?? 
(?? 
Int64?? 
)??  
Math??  $
.??$ %
Round??% *
(??* +
(??+ ,
dateTime??, 4
.??4 5
ToUniversalTime??5 D
(??D E
)??E F
-??G H
new??I L
DateTimeOffset??M [
(??[ \
$num??\ `
,??` a
$num??b c
,??c d
$num??e f
,??f g
$num??h i
,??i j
$num??k l
,??l m
$num??n o
,??o p
TimeSpan??q y
.??y z
Zero??z ~
)??~ 
)	?? Ä
.
??Ä Å
TotalSeconds
??Å ç
)
??ç é
;
??é è
return@@ 
result@@ 
;@@ 
}AA 	
}BB 
}CC É
]C:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Models\Login\LoginModel.cs
	namespace 	
GuerrerosTeam
 
. 
Models 
. 
Login $
{ 
public 

class 

LoginModel 
{ 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Û	
fC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Models\Videogames\VideogameModel.cs
	namespace 	
GuerrerosTeam
 
. 
Models 
. 

Videogames )
{		 
public

 

class

 
VideogameModel

 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Year 
{ 
get 
; 
set "
;" #
}$ %
public 
string 
Genre 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
	Publisher 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ®'
MC:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
var 
configuration 
= 
builder 
. 
Configuration )
;) *
builder 
. 
Services 
. 
AddDbContext 
< 
VideogamesContext /
>/ 0
(0 1
options1 8
=>9 ;
{ 
options 
. 
UseSqlServer 
( 
configuration &
.& '
GetConnectionString' :
(: ;
$str; D
)D E
)E F
;F G
}   
)   
;   
builder// 
.// 
Services// 
.// 
AddControllers// 
(//  
)//  !
;//! "
builder44 
.44 
Services44 
.44 #
AddEndpointsApiExplorer44 (
(44( )
)44) *
;44* +
builder55 
.55 
Services55 
.55 
AddSwaggerGen55 
(55 
)NN 
;NN 
builderdd 
.dd 
Servicesdd 
.dd 4
(AddMicrosoftIdentityWebApiAuthenticationdd 9
(dd9 :
configurationdd: G
)ddG H
;ddH I
builderff 
.ff 
Servicesff 
.ff 
AddTransientff 
<ff  
IVideogameAppServiceff 2
,ff2 3
VideogameAppServiceff4 G
>ffG H
(ffH I
)ffI J
;ffJ K
builderhh 
.hh 
Serviceshh 
.hh 
AddTransienthh 
<hh 
IRepositoryhh )
<hh) *
inthh* -
,hh- .
	Videogamehh/ 8
>hh8 9
,hh9 :

Repositoryhh; E
<hhE F
inthhF I
,hhI J
	VideogamehhK T
>hhT U
>hhU V
(hhV W
)hhW X
;hhX Y
builderkk 
.kk 
Serviceskk 
.kk 
AddCorskk 
(kk 
optionskk  
=>kk! #
{ll 
optionsmm 
.mm 
	AddPolicymm 
(mm 
$strmm $
,mm$ %
buildermm& -
=>mm. 0
{nn 
builderoo 
.oo 
AllowAnyOriginoo 
(oo 
)oo  
.pp 
AllowAnyMethodpp 
(pp 
)pp  
.qq 
AllowAnyHeaderqq 
(qq 
)qq  
;qq  !
}rr 
)rr 
;rr 
}ss 
)ss 
;ss 
varvv 
appvv 
=vv 	
buildervv
 
.vv 
Buildvv 
(vv 
)vv 
;vv 
ifyy 
(yy 
appyy 
.yy 
Environmentyy 
.yy 
IsDevelopmentyy !
(yy! "
)yy" #
)yy# $
{zz 
app{{ 
.{{ 

UseSwagger{{ 
({{ 
){{ 
;{{ 
app|| 
.|| 
UseSwaggerUI|| 
(|| 
)|| 
;|| 
}}} 
appÅÅ 
.
ÅÅ !
UseHttpsRedirection
ÅÅ 
(
ÅÅ 
)
ÅÅ 
;
ÅÅ 
appÇÇ 
.
ÇÇ 
UseAuthentication
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
appÑÑ 
.
ÑÑ 
Use
ÑÑ 
(
ÑÑ 
async
ÑÑ 
(
ÑÑ 
context
ÑÑ 
,
ÑÑ 
next
ÑÑ 
)
ÑÑ 
=>
ÑÑ  
{ÖÖ 
if
áá 
(
áá 
!
áá 	
context
áá	 
.
áá 
User
áá 
.
áá 
Identity
áá 
?
áá 
.
áá  
IsAuthenticated
áá  /
??
áá0 2
false
áá3 8
)
áá8 9
{
àà 
context
ää 
.
ää 
Response
ää 
.
ää 

StatusCode
ää #
=
ää$ %
$num
ää& )
;
ää) *
await
ãã 
context
ãã 
.
ãã 
Response
ãã 
.
ãã 

WriteAsync
ãã )
(
ãã) *
$str
ãã* ?
)
ãã? @
;
ãã@ A
}
åå 
else
éé 
await
éé	 
next
éé 
(
éé 
)
éé 
;
éé 
}èè 
)
èè 
;
èè 
appíí 
.
íí 
UseCors
íí 
(
íí 
$str
íí 
)
íí 
;
íí 
appìì 
.
ìì 
MapControllers
ìì 
(
ìì 
)
ìì 
;
ìì 
appïï 
.
ïï 
Run
ïï 
(
ïï 
)
ïï 	
;
ïï	 
—
`C:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Responses\UserListResponse.cs
	namespace 	
GuerrerosTeam
 
. 
	Responses !
{ 
public 

class 
UserListResponse !
{ 
public 
bool 
HasError 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
List		 
<		 
UserDto		 
>		 
Model		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 
	RequestId

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
} 
} ô
\C:\Users\Josea\Documents\guerrerosteam\GuerrerosTeam\GuerrerosTeam\Responses\UserResponse.cs
	namespace 	
GuerrerosTeam
 
. 
	Responses !
{ 
public 

class 
UserResponse 
{ 
public 
bool 
HasError 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
UserDto		 
Model		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
	RequestId

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
} 
} 