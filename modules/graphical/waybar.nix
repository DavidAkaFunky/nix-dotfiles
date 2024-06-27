{pkgs, ...}: {
    hm.programs.waybar = {
        enable = true;

        #systemd.enable = true;
        
        style = ./waybar.css;

        settings = [
            {
                height = 40;
                spacing = 6;
                #margin = "0 10";

                modules-left = ["hyprland/workspaces"];

                modules-center = ["hyprland/window"];

                modules-right = ["tray" "memory" "pulseaudio" "clock"];

                tray.spacing = 10;

                "hyprland/workspaces" = {
                    on-click = "activate";
                    format = "{icon}";
                    format-icons = {
                        default = "";
                        "1" = "1";
                        "2" = "2";
                        "3" = "3";
                        "4" = "4";
                        "5" = "5";
                        "6" = "6";
                        "7" = "7";
                        "8" = "8";
                        "9" = "9";
                        urgent = "󱓻";
                    };
                    persistent_workspaces = {
                        "1" = [];
                        "2" = [];
                        "3" = [];
                        "4" = [];
                        "5" = [];
                    };
                };

                memory = {
                    interval = 5;
                    format = "󰍛 {}%";
                    max-length = 10;
                };

                clock = {
                    tooltip-format = ''
                        <big>{:%Y %B}</big>
                        <tt><small>{calendar}</small></tt>'';
                    format = "{:%Y/%m/%d %H:%M} ";
                };

                pulseaudio = {
                    format = "{icon}  {volume}%";
                    format-muted = "󰖁";
                    format-icons = {
                        headphone = "";
                        default = ["󰖀" "󰕾" ""];
                    };
                    on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
                    tooltip = false;
                };
            }
        ];
    };
}