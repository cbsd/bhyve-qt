#!/bin/sh

export NOCOLOR=1

DST_OUTPUT="/usr/home/oleg/.qtemu/qtemu.json"
#DST_OUTPUT="/dev/stdout"

cat > ${DST_OUTPUT} <<EOF
{
    "machines": [
EOF

/usr/local/bin/cbsd bls display=jname,vm_os_type,vm_os_profile,vm_cpus,vm_ram,uuid header=0 > /tmp/cbsdvm.txt.$$
vmnum=$( wc -l /tmp/cbsdvm.txt.$$ | awk '{printf $1}' )
curnum=0
cat /tmp/cbsdvm.txt.$$ | while read _jname _type _profile _cpus _ram _uuid; do

	curnum=$(( curnum + 1 ))

	icon=

	case "${_profile}" in
		*[Dd][Ee][Bb][Ii][Aa][Nn]*)
			icon="debian"
			;;
		*[Ff][Rr][Ee][Ee][Bb][Ss][Dd]*)
			icon="freebsd"
			;;
	esac

	[ -z "${icon}" ] && icon="${_type}"

	cat >> ${DST_OUTPUT} <<EOF
        {
            "configpath": "/usr/home/oleg/.qtemu/${_jname}.json",
            "icon": "${icon}",
            "path": "/home/oleg/VMs/test",
            "uuid": "{${_uuid}}"
EOF

	if [ ${curnum} -eq ${vmnum} ]; then
		cat >> ${DST_OUTPUT} <<EOF
        }
EOF
	else
		cat >> ${DST_OUTPUT} <<EOF
        },
EOF
	fi

	cat > /usr/home/oleg/.qtemu/${_jname}.json <<XEOF
{
    "OSType": "BSD",
    "OSVersion": "FreeBSD",
    "RAM": ${_ram},
    "cpu": {
        "CPUCount": ${_cpus}
    },
    "name": "${_jname}",
    "uuid": "{${_uuid}}"
}
XEOF


	done

cat >> ${DST_OUTPUT} <<EOF
    ]
}
EOF

/bin/rm -f /tmp/cbsdvm.txt.$$
