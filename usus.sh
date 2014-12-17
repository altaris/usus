#!/bin/bash

user=$(whoami)
host=$(hostname)
distro=$(uname -v | sed -r "s/.*-(\\w+).*/\1/")
kernel=$(uname -r)
uptime=$(uptime -p)

procs=$(ps -u $(whoami) -o comm --no-headers)
procc=$(echo "$procs" | wc -l)

if [[ -n $(echo "$procs" | grep cinnamon-session) ]]; then
    deskenv="Cinnamon"
elif [[ -n $(echo "$procs" | grep gnome-session) ]]; then
    deskenv="GNOME"
elif [[ -n $(echo "$procs" | grep mate-session) ]]; then
    deskenv="MATE"
elif [[ -n $(echo "$procs" | grep ksmserver) ]]; then
    deskenv="KDE"
elif [[ -n $(echo "$procs" | grep xfce4-session) ]]; then
    deskenv="Xfce"
elif [[ -n $(echo "$procs" | grep lxsession) ]]; then
    deskenv="LXDE"
else
    deskenv="???"
fi

if [[ -n $(echo "$procs" | grep awesome) ]]; then
    winman="Awesome"
elif [[ -n $(echo "$procs" | grep beryl) ]]; then
    winman="Beryl"
elif [[ -n $(echo "$procs" | grep blackbox) ]]; then
    winman="Blackbox"
elif [[ -n $(echo "$procs" | grep compiz) ]]; then
    winman="Compiz"
elif [[ -n $(echo "$procs" | grep dwm) ]]; then
    winman="DWM"
elif [[ -n $(echo "$procs" | grep enlightenment) ]]; then
    winman="Enlightenment"
elif [[ -n $(echo "$procs" | grep herbstluftwm) ]]; then
    winman="herbstluftwm"
elif [[ -n $(echo "$procs" | grep fluxbox) ]]; then
    winman="Fluxbox"
elif [[ -n $(echo "$procs" | grep fvwm) ]]; then
    winman="FVWM"
elif [[ -n $(echo "$procs" | grep i3) ]]; then
    winman="i3"
elif [[ -n $(echo "$procs" | grep icewm) ]]; then
    winman="IceWM"
elif [[ -n $(echo "$procs" | grep kwin) ]]; then
    winman="KWin"
elif [[ -n $(echo "$procs" | grep metacity) ]]; then
    winman="Metacity"
elif [[ -n $(echo "$procs" | grep musca) ]]; then
    winman="Musca"
elif [[ -n $(echo "$procs" | grep nemo) ]]; then
    winman="Nemo"
elif [[ -n $(echo "$procs" | grep openbox) ]]; then
    winman="Openbox"
elif [[ -n $(echo "$procs" | grep pekwm) ]]; then
    winman="PekWM"
elif [[ -n $(echo "$procs" | grep ratpoison) ]]; then
    winman="ratpoison"
elif [[ -n $(echo "$procs" | grep scrotwm) ]]; then
    winman="ScrotWM"
elif [[ -n $(echo "$procs" | grep wmaker) ]]; then
    winman="Window Maker"
elif [[ -n $(echo "$procs" | grep wmfs) ]]; then
    winman="Wmfs"
elif [[ -n $(echo "$procs" | grep wmii) ]]; then
    winman="wmii"
elif [[ -n $(echo "$procs" | grep xfwm4) ]]; then
    winman="Xfwm"
elif [[ -n $(echo "$procs" | grep xmonad) ]]; then
    winman="xmonad"
else
    winman="???"
fi

shell=$SHELL
term=$TERM
cpu=$(cat /proc/cpuinfo | grep "model name" | head -n 1 | sed -r "s/.*: (.*)/\1/")

packc=$(dpkg --get-selections | wc -l)

out="
            .,-;;//;\=,.                    User     : $user
         . 1H@@@MM@M#H/ ,+;,                Hostname : $host
      ,/X+ +M@@M@MM% ,-%HMMM@X/,            
    -+@MM; SM@@MH+- ;XMMMM@MMMM@+-          Kernel   : $kernel
   ,@M@@M- XM@X;. -+XXXXXHHH@M@M.--.        Distro   : $distro
  ,%MM@@MH ,@%=            ..--=-=;=,.      Uptime   : $uptime
  +@#@@@MX .,              -%HXSS%%%+;      Procs    : $procc
 =; .@M@M$                  .;@MMMM@MM;     
 X@= -#MM/                    .+MM@@@M#;    Shell    : $shell
,@M@H; ;@1                     . =X#@@@@    Terminal : $term
,@@@MMX, .                    /H- ;@M@M=    WM       : $winman
.H@@@@M@+,                    %MM+. %#$.    DeskEnv  : $deskenv
 /MMMM@MMH\.                  XM@MH; =;     Packages : $packc
  /%+%SXHH@#=              , .H@@@@MX,      
   .,,.,,..,,,           -%H ,@@@@@MX,      CPU      : $cpu
    %MM@@@HHHXM++;;-- .;SMMX =M@@MM%.       
     =XMCAMAMAGUEY ,-+HMM@M+ /MMMX=         
       =%@M@M#@S .=#@MM@@@M; %M%=           
         ,;+#+- /H#MMMMMMM@= =,             
           --. =++%%%%+/;-.                 
"

if [[ -n $(which lolcat) ]]; then
    echo "$out" | lolcat
else
    echo "$out"
fi