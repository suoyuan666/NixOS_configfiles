{ config, pkgs, ... }:
{
  
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.mpv = {
    enable = true;
  }
  programs.mpv = {
    enable = true;
    
    config = {
      vo = "gpu-next";              # 使用下一代视频渲染器，画质更好
      gpu-api = "vulkan";           # NVIDIA 建议使用 Vulkan 以获得更佳性能
      hwdec = "nvdec";              # 硬件加速：直接使用 NVIDIA NVDEC 接口
      
      profile = "gpu-hq";           # 启用内置的高质量预设
      video-sync = "display-resample"; # 解决 24帧电影在 60Hz 屏幕上的抖动
      interpolation = true;         # 配合上条实现平滑滚动
      tscale = "oversample";        # 降低运动模糊
      
      sub-auto = "fuzzy";           # 自动加载名称近似的字幕
      sub-font = "Noto Sans Mono CJK SC";
      sub-font-size = 40;
      
      cache = true;
      demuxer-max-bytes = "500MiB";
    };

    bindings = {
      "RIGHT" = "seek 5";
      "LEFT" = "seek -5";
      "UP" = "add volume 2";
      "DOWN" = "add volume -2";
      "SPACE" = "cycle pause";
      "m" = "no-osd cycle mute";
      "f" = "cycle fullscreen";
      
      "menu" = "script-binding uosc/menu";
      "q" = "quit";
    };
  };
}
