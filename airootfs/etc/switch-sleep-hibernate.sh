#!/bin/bash

if [[ ! -f ~/.config/powermanagementprofilesrc ]]; then
mkdir -p ~/.config
fi
cat <<'EOF' > ~/.config/powermanagementprofilesrc
[AC][DPMSControl]
idleTime[$d]
lockBeforeTurnOff[$d]

[AC][HandleButtonEvents]
lidAction=2
powerButtonAction=2

[Battery][DPMSControl]
idleTime[$d]
lockBeforeTurnOff[$d]

[Battery][HandleButtonEvents]
lidAction=2
powerButtonAction=2

[Battery][SuspendSession]
idleTime[$d]
suspendThenHibernate[$d]
suspendType[$d]

[LowBattery][BrightnessControl]
value[$d]

[LowBattery][DPMSControl]
idleTime[$d]
lockBeforeTurnOff[$d]

[LowBattery][HandleButtonEvents]
lidAction=2
powerButtonAction=2

[LowBattery][SuspendSession]
idleTime[$d]
suspendThenHibernate[$d]
suspendType[$d]
EOF

set_powerbutton_hibernate() {
sed -i 's#lidAction=.*#lidAction=2#;s#powerButtonAction=.*#powerButtonAction=2#' ~/.config/powermanagementprofilesrc 
}

set_powerbutton_sleep() {
sed -i 's#lidAction=.*#lidAction=1#;s#powerButtonAction=.*#powerButtonAction=1#' ~/.config/powermanagementprofilesrc 
}

echo "Enter '1' to set sleep mode or '2' to set hibernate mode (recommended) for the powerbutton keymap: "
read choice

case $choice in
    1)
        set_powerbutton_sleep
        ;;
    2)
        set_powerbutton_hibernate
        ;;
    *)
        echo "Invalid input. Please enter 1 or 2."
        ;;
esac
