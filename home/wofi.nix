{ config, pkgs, ... }:
{
programs.wofi = {
    enable = true;
    settings = {
        hide_scroll="true";
        show="drun";
        width="30%";
        height="40%";
        lines=9;
        line_wrap="word";
        term="kitty";
        allow_markup=true;
        always_parse_args=false;
        show_all=true;
        print_command=true;
        layer="overlay";
        allow_images=true;
        sort_order="alphabetical";
        gtk_dark=true;
        image_size=20;
        display_generic=false;
        location="center";
        key_expand="Tab";
        insensitive=false;
    };
  style = "
* {
  font-family: Noto Sans Mono;
  color: #bfc8d8;
  background: transparent;
}

#window {
  background: rgba(38, 31, 82, 0.5);
  margin: auto;
  padding: 10px;
  border-radius: 20px;
  border: 5px solid #b072d1;
}

#input {
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 15px;
}

#outer-box {
  padding: 20px;
}

#img {
  margin-right: 6px;
}

#entry {
  padding: 10px;
  border-radius: 15px;
}

#entry:selected {
  background-color: #2e3440;
}

#text {
  margin: 2px;
}
    ";
};

}
