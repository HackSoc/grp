hacksoc-grp
===========


hacksoc-grp (pronounced "HackSoc Group"), or simply grp, is a
collection of software maintained by [HackSoc](https://hacksoc.org)
for use with the ITS linux machines, which would not otherwise be
provided: more up-to-date packages, things which aren't strictly
course-related, that sort of thing. All packages are built with a
prefix of /tmp/hacksoc-grp.

You can see all packages which have been installed by listing
/tmp/hacksoc-grp/pkg, and all versions of a particular package by
listing /tmp/hacksoc-grp/pkg/<name>.

To request new software for grp, simply email hack@yusu.org, and we'll
look into it.

Mounting
--------

You can mount grp with the following script. It may be helpful to save
it to ~/grp.sh, and then source it to both mount grp and update your
environment simultaneously.

```bash
GRPDIR=/tmp/hacksoc-grp

if [[ ! -e $GRPDIR/bin ]]; then
    mkdir -p $GRPDIR
    sshfs -o reconnect grp@klaxon.hacksoc.org: $GRPDIR
fi

export PATH=$GRPDIR/bin:$PATH
export LD_LIBRARY_PATH=$GRPDIR/lib:$LD_LIBRARY_PATH
```

**Health Warning:** Do not put this in your shell profile, as then if
  SSHFS hangs you won't be able to open a shell, which would be bad.

**Second Health Warning:** After executing this, your environment will
  be changed. Interaction with executables on the host system may
  change. So, instead of running the export lines of the script, you
  could just mount grp and then use a function like this to set up
  your environment for individual commands:

```bash
function grprun() {
    local GRPDIR=/tmp/hacksoc-grp
    PATH=$GRPDIR/bin:$PATH \
    LD_LIBRARY_PATH=$GRPDIR/lib:$LD_LIBRARY_PATH \
    $*
}
```
