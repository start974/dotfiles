[
  {
    block = "disk_space";
    path = "/";
    alias = "sys";
    info_type = "used";
    format = "{icon} {alias}: {used}/{total}";
    unit = "GB";
    interval = 60;
    alert = 80.0;
    warning = 50.0;
  }
  {
    block = "disk_space";
    path = "/drive/data";
    alias = "data";
    info_type = "used";
    format = "{alias}: {available} free";
    unit = "GB";
    interval = 2 * 60;
    warning = 60.0;
    alert = 80.0;
  }
  {
    block = "cpu";
    interval = 1;
    format = "{barchart}{utilization} {frequency}";
  }
  {
    block = "load";
    interval = 2;
    format = "{1m}";
  }
  {
    block = "memory";
    display_type = "memory";
    format_mem = "{mem_used}({mem_used_percents})";
    icons = true;
    clickable = false;
    interval = 5;
    warning_mem = 70;
    critical_mem = 90;
  }
  {
    block = "net";
    format = "{ssid} {speed_up;K*b} {speed_down;K*b}";
    interval = 5;
  }
  {
    block = "backlight";
    step_width = 5;
  }
  {
    block = "sound";
    step_width = 5;
  }
  {
    block = "music";
    player = "spotify";
    hide_when_empty = true;
    buttons = ["play" "next"];
  }
  {
    block = "battery";
    interval = 5;
    format = "{percentage} {time}";
  }
  {
    block = "time";
    interval = 15;
    format = "%R - %a %D";
  }
]
