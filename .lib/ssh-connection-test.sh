typeset -r _GL=gitlab.cs.usu.edu
typeset -r _GL_HOSTKEY_ED25519=SHA256:tIjwsWWEm+4NppPonV2Fkqe252DJqLWEJ5ygaAHbs2o
typeset -r _GL_HOSTKEY_ECDSA=SHA256:4x+G97yflra4K2KWnF19ZNrZGL1iqjQaq8HVwu/mX6U


# TODO v2.0: when an SSH key already exists, offer to
#   a)  quit and change nothing
#   b)  start the lesson create brand-new keys
#   c)  start the lesson without creating new keys
_ssh_key_exists_msg() {
	cat <<-MSG
	I found an SSH key named $(path $(basename $1)) under $(path ~/.ssh).

	  * If you proceed with the lesson, you will skip over the step that
	    creates a new SSH key.

	  * If you would like to re-generate your SSH key under the tutorial's
	    guidance, exit this lesson, delete these files and start over again:

	  $(path $1)
	  $(path $1.pub)

	MSG
	_tutr_pressenter
}


_ssh_key_is_missing_msg() {
	cat <<-MSG
	${_Y}    ______
	${_Y}---'    __)     ${_Z}Your SSH key is missing!
	${_Y}         __)    ${_Z}You can fix this yourself by running lesson 5 in the
	${_Y}          __)   ${_Z}original Shell Tutor again:
	${_Y}       ____)    ${_Z}Run this command:
	${_Y}---.  (         ${_Z}  $(cmd MENU=yes ./tutorial.sh)
	${_Y}    '. \\        ${_Z}Then choose ${_W}5-ssh-key.sh
	${_Y}      \\_)
	${_Y}                ${_Z}Contact $_EMAIL if you need assistance.

	MSG
}


_ssh_add_hostkey_msg() {
	cat <<-:
	Checking connection to $(cyn $_GL)...

	Upon your first connection to $(ylw "DuckieCorp's") GitLab server from this
	device, you must verify that you're linking to the $(bld real) server and
	not an imposter.

	Look for the fingerprint in a line of text that begins as one of these:
	  $(bld ED25519 key fingerprint is  ${_GL_HOSTKEY_ED25519:0:7}...)
	  $(bld ECDSA key fingerprint is  ${_GL_HOSTKEY_ECDSA:0:7}...)

	*  If the server's fingerprint $(bld exactly) matches $(grn mine,) answer "$(kbd yes)".
	   Afterward, you will not see this message again.
	*  If the fingerprints $(bld DO NOT) match, answer "$(kbd no)" and contact
	   $_EMAIL.

	The server's fingerprint should match one of these:
	                    $(grn $_GL_HOSTKEY_ECDSA)
	                    $(grn $_GL_HOSTKEY_ED25519)
	:
}


# Test if a private key is already present on the local side;
# if so, put its name into REPLY and return success
#
# Unset REPLY and return failure when there is no private key in ~/.ssh
_tutr_ssh_key_is_present() {
	if   [[ -f ~/.ssh/id_rsa ]]; then
		REPLY=~/.ssh/id_rsa
		return 0
	elif [[ -f ~/.ssh/id_ed25519 ]]; then
		REPLY=~/.ssh/id_ed25519
		return 0
	elif [[ -f ~/.ssh/id_dsa ]]; then
		REPLY=~/.ssh/id_dsa
		return 0
	elif [[ -f ~/.ssh/id_ecdsa ]]; then
		REPLY=~/.ssh/id_ecdsa
		return 0
	elif [[ -f ~/.ssh/id_ecdsa-sk ]]; then
		REPLY=~/.ssh/id_ecdsa-sk
		return 0
	elif [[ -f ~/.ssh/id_ec25519-sk ]]; then
		REPLY=~/.ssh/id_ec25519-sk
		return 0
	fi
	REPLY=
	return 1
}


_no_internet_msg() {
	cat <<-MSG

	${_B}                ooooooooooo                ${_Z}      A working internet
	${_B}          ooooooooooooooooooooooo          ${_Z}    connection is required
	${_B}       ooooooooooooooooooooooooooooo       ${_Z}        for this lesson
	${_B}    ooooooooooo             ooooooooooo    ${_Z}
	${_B}  ooooooooo    ooooooooooooo    ooooooooo  ${_Z}   On-campus users: USU-guest
	${_B}oooooooo    ooooooooooooooooooo    oooooooo${_Z}   WiFi is known to not work
	${_B} oooooo  ooooooooooooooooooooooooo  oooooo ${_Z}      Use Eduroam instead
	${_B}   oo  ooooooooo           ooooooooo  oo   ${_Z}
	${_B}      oooooo    ooooooooooo    oooooo      ${_Z}   Restart this lesson after
	${_B}        oo   ooooooooooooooooo   oo        ${_Z}     addressing the issue
	${_B}            ooooooooooooooooooo            ${_Z}
	${_B}             oooooo     oooooo             ${_Z}
	${_B}              oo    ooo    oo              ${_Z}   If the problem persists,
	${_B}                   ooooo                   ${_Z}        please contact
	${_B}                   ooooo                   ${_Z}      $_EMAIL
	${_B}                    ooo                    ${_Z}           for help

	${_W}Original error message:
	${_Z}$@
	MSG
}


_too_many_auth_failures_msg() {
	cat <<-MSG
	${_C}     .---------.      ${_Z}
	${_C}    / .-------. \\     ${_Z} You do not need a password to access the SSH
	${_C}   / /         \\ \\    ${_Z} server.  The fact that you were asked for one
	${_C}   | |         | |    ${_Z} means that there is something wrong with your
	${_C}  _| |_________| |_   ${_Z} SSH key.
	${_C}.' |_|         |_| '. ${_Z}
	${_C}'._____ _____ _____.' ${_Z} You can fix this yourself by running lesson 5
	${_C}|     .'_____'.     | ${_Z} in the original Shell Tutor again:
	${_C}'.__.'.'     '.'.__.' ${_Z} Run this command:
	${_C}'.__  |  SSH  |  __.' ${_Z}   $(cmd MENU=yes ./tutorial.sh)
	${_C}|   '.'._____.'.'   | ${_Z} Then choose ${_W}5-ssh-key.sh
	${_C}'.____'._____.'____.' ${_Z}
	${_C}'._____________LGB_.' ${_Z} Contact $_EMAIL if you need assistance.

	${_W}Original error message:
	${_Z}$@
	MSG
}


_host_key_verification_fail_msg() {
	cat <<-MSG
	                ${_R}Do not proceed with the connection!${_Z}

	${_Y} 8 8 8 8               ,ooo.   ${_Z} Your vigilance in not accepting an
	${_Y} 8a8 8a8              oP   ?b  ${_Z} unverified host key is appreciated
	${_Y}d888a888zzzzzzzzzzzzzz8     8b ${_Z} and necessary for maintaining system
	${_Y} '""^""'              ?o___oP' ${_Z} integrity.

	   It is a critical security concern if the provided SSH host key
	                  does not match the expected one.

	      Please report this issue to $_EMAIL immediately.

	${_W}Original error message:
	${_Z}$@
	MSG
}


_other_problem_msg() {
	cat <<-MSG

	${_y}     _.-^^---....,,--,     ${_Z}
	${_y} _--                 '--_  ${_Z}
	${_y}<                        ) ${_Z}  The tutorial is unable to connect to the
	${_y}|                        | ${_Z}  SSH server for an undetermined reason.
	${_y} \\._                   _/ ${_Z}
	${_y}    \`\`\`--. . , ; .--'''    ${_Z}  Please contact $_EMAIL and
	${_y}          | |   |          ${_Z}  share the error message displayed below
	${_y}       .-=||  | |=-.       ${_Z}  for assistance.
	${_y}       \`-=#$%&%&#=-'       ${_Z}
	${_y}          | ;  :|          ${_Z}
	${_y} _____.,-#%&#@%#&#~,._____ ${_Z}

	${_W}Original error message:
	${_Z}$@
	MSG
}

# There are four ways connecting to GitLab could fail
#  0. No internet|host key verification failed = fix the problem and try again
#  1. No local SSH keys = create and upload new key to GitLab
#  2. Local SSH key is not on GitLab = don't re-create, but upload to GitLab
#  3. Local key exists on GitLab = mark this lesson complete and move on
#
# Testing the various modes of failure:
#
# WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
#   AKA: Host key verification failed.
#   (triggered by editing /etc/hosts; could also happen by editing
#   .ssh/authorized_hosts)
#
# The authenticity of host '...' can't be established
#   Remove host keys with
#     $ ssh-keygen -R gitlab.cs.usu.edu
#
# ssh: connect to host gitlab.cs.usu.edu port 22: Connection timed out
#   (triggered by blocking the host in iptables:
#     $ sudo iptables -A OUTPUT -o wlan0 -d gitlab.cs.usu.edu -j DROP
#   This command removes that rule
#     $ sudo iptables -D OUTPUT 1
_tutr_assert_ssh_connection_is_okay() {
	[[ -z $DEBUG ]] && clear || set -x

	ssh-keygen -F $_GL 2>&1 || _tutr_info _ssh_add_hostkey_msg

	local msg stat
	msg=$(ssh -o PasswordAuthentication=no -o ConnectTimeout=7 -T git@$_GL 2>&1)
	stat=$?

	case $stat in
		0)
			if [[ $msg == "Welcome to GitLab"* ]]; then
				export _GL_USERNAME=${msg:20:-1}
			else
				export _GL_USERNAME=
			fi
			;;
		255)
			if   [[ $msg == *"Permission denied"* ]]; then
				# This message means the internet is working and
				# the SSH key is not on GitLab.
				# See if there is a local SSH key
				if _tutr_ssh_key_is_present; then
					_tutr_warn _ssh_key_exists_msg $REPLY
				fi
			elif [[ $msg == *"Could not resolve hostname"* ]]; then
				# DNS is down
				_tutr_die _no_internet_msg "$msg"
			elif [[ $msg == *"Connection timed out"* ]]; then
				# Network is down
				_tutr_die _no_internet_msg "$msg"
			elif [[ $msg == *"Host key verification failed"* ]]; then
				# Host key changed/spoofed
				_tutr_die _host_key_verification_fail_msg "'$msg'"
			elif [[ $msg == *"Too many authentication failures"* ]]; then
				# User was prompted for password
				_tutr_die _too_many_auth_failures_msg "'$msg'"
			else
				_tutr_die _other_problem_msg "'$msg'"
			fi
			;;
		*)
			if _tutr_ssh_key_is_present; then
				_tutr_warn _ssh_key_exists_msg $REPLY
			else
				_tutr_die _ssh_key_is_missing_msg
			fi
			;;
	esac
	[[ -n $DEBUG ]] && set +x
	return 0
}

# vim: set filetype=sh noexpandtab tabstop=4 shiftwidth=4 textwidth=76 colorcolumn=76:
