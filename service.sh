sleep 5
MODDIR=${0%/*}
chmod 0755 "$MODDIR/Change_GameKey_Function.sh"
chmod 0755 "$MODDIR/CGF_config"
chmod 0755 "$MODDIR/user-owned_shell_up2down.sh"
chmod 0755 "$MODDIR/user-owned_shell_down2up.sh"
/system/bin/sh $MODDIR/Change_GameKey_Function.sh 2>&1 >/dev/null &
exit 0