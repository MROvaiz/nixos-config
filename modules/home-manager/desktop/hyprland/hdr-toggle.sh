#!/usr/bin/env bash
toggle_hdr() {
    local info=$(hyprctl -j monitors | jq -r '.[0]')
    local monitor=$(echo "$info" | jq -r '.name')
    local width=$(echo "$info" | jq -r '.width')
    local height=$(echo "$info" | jq -r '.height')
    local refresh=$(echo "$info" | jq -r '.refreshRate')
    local mode="${width}x${height}@${refresh}"
    local current_mode=$(echo "$info" | jq -r '.colorManagementPreset')
    
    if [[ "$current_mode" == "srgb" ]] || [[ "$current_mode" == "auto" ]]; then
        hyprctl keyword monitor "${monitor},${mode},0x0,1,bitdepth,10,cm,hdredid,sdrbrightness,1.3,sdrsaturation,1.0"
    else
        hyprctl keyword monitor "${monitor},${mode},0x0,1,bitdepth,8,cm,auto,sdrbrightness,1.0,sdrsaturation,1.0"
    fi
}
status_hdr() {
    local current_mode=$(hyprctl -j monitors | jq -r '.[0].colorManagementPreset')
    if [[ "$current_mode" == "srgb" ]] || [[ "$current_mode" == "auto" ]]; then
        echo 'SDR'
    else
        echo 'HDR'
    fi
}
if [[ "$1" == "--status" ]]; then
    status_hdr
else
    toggle_hdr
    status_hdr
fi