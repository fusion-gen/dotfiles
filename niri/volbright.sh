#!/bin/sh

SINK="@DEFAULT_AUDIO_SINK@"
STEP=0.05   # 5%

clamp() {
    awk -v v="$1" 'BEGIN {
        if (v > 1) v = 1;
        if (v < 0) v = 0;
        print v
    }'
}

send_volume() {
    vol=$(wpctl get-volume "$SINK" | awk '{print int($2*100)}')

    if wpctl get-volume "$SINK" | grep -q '\[MUTED\]'; then
        notify-send \
            -h string:x-canonical-private-synchronous:audio \
            -h int:value:0 \
            -h int:max-value:100 \
            "Muted"
    else
        notify-send \
            -h string:x-canonical-private-synchronous:audio \
            -h int:value:$vol \
            -h int:max-value:100 \
            "Volume: $vol%"
    fi
}

send_brightness() {
    max=$(brightnessctl max)
    val=$(brightnessctl get)
    pct=$(( val * 100 / max ))

    notify-send \
        -h string:x-canonical-private-synchronous:brightness \
        -h int:value:$pct \
        -h int:max-value:100 \
        "Brightness: $pct%"
}

set_volume() {
    current=$(wpctl get-volume "$SINK" | awk '{print $2}')
    new=$(awk -v c="$current" -v s="$STEP" 'BEGIN {print c + s}')
    new=$(clamp "$new")

    wpctl set-volume "$SINK" "$new"
    send_volume
}

set_volume_down() {
    current=$(wpctl get-volume "$SINK" | awk '{print $2}')
    new=$(awk -v c="$current" -v s="$STEP" 'BEGIN {print c - s}')
    new=$(clamp "$new")

    wpctl set-volume "$SINK" "$new"
    send_volume
}

case "$1" in
    vol_up)
        set_volume
        ;;

    vol_down)
        set_volume_down
        ;;

    mute)
        wpctl set-mute "$SINK" toggle
        send_volume
        ;;

    bright_up)
        brightnessctl set 5%+
        send_brightness
        ;;

    bright_down)
        brightnessctl set 5%-
        send_brightness
        ;;
esac
