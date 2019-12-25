Config {
    position = Top,
    font = "xft:Iosevka:style=Regular:size=12:antialias=true,M+ 1p:style=regular:size=12:antialias=true,siji:size=13:antialias=true", -- siji converted to ttf
    bgColor = "#18191A",
    fgColor = "#C2C5C6",
    border = BottomB,
    borderColor = "#262829",
    borderWidth = 1,
    lowerOnStart = True,
    hideOnStart = False,
    overrideRedirect = False,
    allDesktops = True,
    persistent = False,
    commands = [
        Run MultiCpu [
            "-t", "<fc=#9A758E></fc> <total>%",
            --"-t", "<fc=#9A758E>cpu</fc> <total>%",
            "-L", "10",
            "-H", "70",
            "--high", "#FFB6B0"
            ] 10,
        Run MultiCoreTemp [
            "-t", "<fc=#9A758E></fc> <avg>°C",
            "-L", "40", "-H", "60",
            "-h", "red"
            ] 10,
        Run Memory [
            "-t","<fc=#9A758E></fc> <usedratio>%",
            --"-t","<fc=#9A758E>mem</fc> <usedratio>%",
            "-H","3000","-h","#FFB6B0"
            ] 10,
        --Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "<fc=#9A758E></fc> <fc=#C2C5C6>%F</fc> <fc=#9A758E></fc> <fc=#C2C5C6>%H:%M</fc>" "date" 10,
        --Run Date "<fc=#9A758E>[</fc> <fc=#C2C5C6>%F</fc> <fc=#C2C5C6>%H:%M</fc> <fc=#9A758E>]</fc>"  "date" 10,
        --Run Network "eno1" ["-t","<fc=#9A758E></fc> <rx> KB/s <fc=#9A758E></fc> <tx> KB/s"] 10,
        Run Network "eno1" ["-t","<fc=#9A758E>down</fc> <rx> KB/s <fc=#9A758E>up</fc> <tx> KB/s"] 10,
        Run Com "getMasterVolume" [] "volumelevel" 1,
        --Run Com "getMasterVolumeNoIcons" [] "volumelevel" 1,
        Run Com "getRedshift" [] "redshift" 60,
        Run MPD ["-t",
            "<fc=#9A758E></fc> <title> - <artist> [<lapsed>/<length>] <statei>",
            --"<fc=#9A758E><title></fc> <fc=#C2C5C6>-</fc> <fc=#9A758E><artist></fc>「<lapsed>/<length>」"
            "--", "-P", "<fc=#9A758E></fc>", "-Z", "<fc=#9A758E></fc>", "-S", "<fc=#9A758E></fc>"
            ] 10,
        Run StdinReader
        ],
    sepChar = "%",
    alignSep = "||",
    template = "%StdinReader% || %mpd% | %volumelevel% | %multicpu% | %memory% | <fc=#FFFFCC>%date%</fc> | %redshift%"
    --template = "%StdinReader% || %mpd% | %volumelevel% | %multicpu% | %multicoretemp% | %memory% | <fc=#FFFFCC>%date%</fc> | %redshift%"
}
