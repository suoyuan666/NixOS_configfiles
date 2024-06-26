_: {
  programs.hyprlock = {
    enable = true;
    backgrounds = [{
	path = "";
    }];
    images = [
      {
        #path = "/home/zuos/Pictures/logo.png";

      }
    ];
    general = {
      grace = 5;
      disable_loading_bar = false;
      hide_cursor = false;
      no_fade_in = false;
    };
    input-fields = [
      {
        monitor = "";
        size = {
          width = 300;
          height = 50;
        };
        outline_thickness = 2;

        outer_color = "rgb(f5c2e7)";
        inner_color = "rgb(1e1e2e)";
        font_color = "rgb(cdd6f4)";
        placeholder_text = ''
          <span foreground="##cdd6f4">Password...</span>
        '';
        fade_on_empty = false;
        dots_spacing = 0.3;
        dots_center = true;
      }
    ];
    labels = [
      {
        monitor = "";
        text = "Hi, $USER";
        color = "rgb(1e1e2e)";
        valign = "center";
        halign = "center";
      }
      {
        monitor = "";
        text = "$TIME";
        color = "rgb(1e1e2e)";
        position = {
          x = 0;
          y = 120;
        };
        valign = "center";
        halign = "center";
      }
    ];
  };
}
