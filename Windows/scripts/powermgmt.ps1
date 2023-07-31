# lid close action when on battery
powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1

# lid close action when plugged in
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

powercfg -SetActive SCHEME_CURRENT

# https://winaero.com/how-to-change-default-lid-close-action-on-windows-10/
# ACTION_ID	Action
# 0	Do nothing
# 1	Sleep
# 2	Hibernate
# 3	Shut down