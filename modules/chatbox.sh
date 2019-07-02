#!/bin/bash

escSeq="\x1B[";
delayQuantum=.2;

# ==== GENERAL STYLING ALIASES

## === ==== text color

fgDefault="39";
fgYellow="33";
fgCyan="36";
fgRed="91";
fgMagenta="35"

## === ==== text bg

bgDefault="49"
bgRed="41"

## === ==== text weight

weightRegular="21"
weightBold="1"

style () {
	local retval 
	if [[ $1 -ne 0 ]]; then
		retval="${escSeq}${1};${2}m"
		echo "$retval" 
	else 
		retval="${escSeq}0m"
		echo "$retval"
	fi;
}

# ==== CHARACTERS

devilName="the devil"
devilColor="$fgRed"
devilNameStyled="$(style $devilColor $weightBold)$devilName$(style 0)"

userName="I FORGOT MY NAME"					# verbose default
userColor="$fgRed";							# verbose default
userNameStyled="$(style $userColor $weightBold)$userName$(style 0)"

scriptName="I NEVER HAD A FUCKING NAME";	# verbose default
scriptColor="$fgMagenta";					# verbose default
scriptNameStyled="$(style $scriptColor $weightBold)$scriptName$(style 0)"

# ==== FUNCTIONS

devilnames () {
	case $1 in 								# I HOPE YOU REALIZE THAT THIS PART ONLY MAKES IT WORSE
		script)
			scriptName="$2"
			userColor="$fgCyan";
			;;
		user)
			userName="$2"
			scriptColor="$fgYellow";
			;;
		*)
            devilsays "I only give names to user and script."
            devilsays "I'm not really impressive at it but it's my duty"
            devilsays "you know"
            chatpsa devil left
            return 91
	esac; 
}

devilsays () {
	local mp=0
	mp=$2*$delayQuantum
	sleep $mp
	printf "%b%s:%b " $(style "$devilColor" "$weightBold") "$devilName" $(style 0);
	printf "%s%b\n" "$1" $(style 0); 
}

devilmakes () { 
	local mp=0
	mp=$4*$delayQuantum
	sleep $mp
	
	case $1 in 								# I won't even say anything about this part. 
		script)
			partyColor="$scriptColor"
			partyName="$scriptName"
			;;
		user)
			partyColor="$userColor"
			partyName="$userName"
			;;
		*)
            devilsays "who the fuck is that? don't bother answering I don't give a shit bye"
            return 92
	esac

							# announcing speaker
	printf "%b%s:%b " $(style "$partyColor" "$weightBold") "$partyName" $(style 0);

	case $2 in 
		say) 				# outputting speaker's line
			printf "%s%b\n" "$3" $(style 0)
			;;
		confess)
			read userInputRaw
			userInputLC="$(echo $userInputRaw | tr '[A-Z]' '[a-z]')"
			userInputFixed="_${userInputLC//[^a-z-_]/}_"
			if [[ $3 != "" ]]; 
				then 
					v2rw_name="$3"
					eval eval "\${v2rw_name}=\$userInputFixed"
				else 
					devilsays "$scriptName wasn't taking notes if you're interested"
			fi
			;;
		*)
			devilsays "I only make guys like you say stuff and confess. stuff."
			return 93
    esac; }

chatpsa () {
	action="did nothing lol. this msg is for the sake of verbose mode"
	local mp=0
	mp=$3*$delayQuantum
	sleep $mp

	case $1 in 								# WHEN I SEE THIS PART I FUCKING CRY BLOOD. PLEASE REWRITE IT
		script)
			partyColor="$scriptColor"
			partyName="$scriptName"
			;;			
		user)
			partyColor="$userColor"
			partyName="$userName"
			;;
		devil)
			partyColor="$devilColor"
			partyName="$devilName"
			;;
		*)
			devilsays "this had to be a PSA but I have no idea who $1 is so I'll skip it"
	esac

	prefix=""
	action=""
	case $2 in
		left)
			action="has left the chat"
			;;
		joined)
			action="has joined the chat"			
			;;
		summoned)
			action="has summoned $3"
			;;
		kicked)
			action="has kicked $3 from here"
			;;
		alone)
			action="is completely alone"
			prefix="with even $devilNameStyled gone, "
			;;
		*)
			devilsays "this had to be a PSA but someone fucked up the very essence of it. don't worry"
	esac

	printf "[ %b" "$prefix"
	printf "%b%s%b " $(style "$partyColor" "$weightRegular") "$partyName" $(style 0);
	printf "%s%b ]\n" "$action" $(style "$fgDefault" "$weightRegular"); 
}

chatstart () {
	clear
	launchTime="$(date)"
	printf "\n%b === === === artificial intelligence core module entered at $launchTime === === === %b \n\n" \
	$(style "$devilColor" "$weightBold") $(style 0);
	chatpsa user joined 1
	chatpsa script joined 1
}

chatclose () {
	printf "\n%b === === === === === === === === === === glhf bb === === === === === === === === === === === %b \n\n" \
	$(style "$devilColor" "$weightBold") $(style 0);
	exit $1
}