#!/bin/sh

# WIP!!! Reloads Tuxedo drivers in order

MOD_DIR="/usr/lib/modules/$(uname -r)/extra/tuxedo-drivers/"

# List of modules to be removed in order
rmmod_modules=(
    tuxedo_nb02_nvidia_power_ctrl
    tuxedo_io
    uniwill_wmi
    clevo_wmi
    clevo_acpi
    tuxedo_keyboard
    ite_8291
    ite_8291_lb
    ite_8297
    ite_829x
    tuxedo_nb05_fan_control
    tuxedo_nb05_kbd_backlight
    tuxedo_nb05_keyboard
    tuxedo_nb05_sensors
    tuxedo_nb05_power_profiles
    tuxedo_nb05_ec
    tuxedo_nb04_kbd_backlight
    tuxedo_nb04_power_profiles
    tuxedo_nb04_sensors
    tuxedo_nb04_keyboard
    tuxedo_nb04_wmi_ab
    tuxedo_nb04_wmi_bs
    tuxedo_compatibility_check
    stk8321
    gxtp7380
    tuxedo_tuxi_fan_control
    tuxi_acpi
)

# List of modules to be loaded in order
modprobe_modules=(
    tuxedo_compatibility_check
    tuxedo_keyboard
    clevo_acpi
    clevo_wmi
    uniwill_wmi
    tuxedo_io
    tuxedo_nb02_nvidia_power_ctrl
    ite_8291
    ite_8291_lb
    ite_8297
    ite_829x
    tuxedo_nb05_ec
    tuxedo_nb05_power_profiles
    tuxedo_nb05_sensors
    tuxedo_nb05_keyboard
    tuxedo_nb05_kbd_backlight
    tuxedo_nb05_fan_control
    tuxedo_nb04_keyboard
    tuxedo_nb04_wmi_ab
    tuxedo_nb04_wmi_bs
    tuxedo_nb04_sensors
    tuxedo_nb04_power_profiles
    tuxedo_nb04_kbd_backlight
    stk8321
    gxtp7380
    tuxedo_tuxi_fan_control
    tuxi_acpi
)

# Remove all specified modules in order
for module in "${rmmod_modules[@]}"; do
    echo "rmmod $module"
    rmmod $module
done

# Remove all from MOD_DIR
for module in $(ls $MOD_DIR); do
    echo "rmmod $module"
    rmmod $module
done

# Load all specified modules in order
for module in "${modprobe_modules[@]}"; do
    echo "modprobe $module"
    modprobe $module
done