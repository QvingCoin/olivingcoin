#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

OLIVINGCOIND=${OLIVINGCOIND:-$BINDIR/olivingcoind}
OLIVINGCOINCLI=${OLIVINGCOINCLI:-$BINDIR/olivingcoin-cli}
OLIVINGCOINTX=${OLIVINGCOINTX:-$BINDIR/olivingcoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/olivingcoin-wallet}
OLIVINGCOINQT=${OLIVINGCOINQT:-$BINDIR/qt/olivingcoin-qt}

[ ! -x $OLIVINGCOIND ] && echo "$OLIVINGCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
OLCVER=($($OLIVINGCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for olivingcoind if --version-string is not set,
# but has different outcomes for olivingcoin-qt and olivingcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$OLIVINGCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $OLIVINGCOIND $OLIVINGCOINCLI $OLIVINGCOINTX $WALLET_TOOL $OLIVINGCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${OLCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${OLCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
