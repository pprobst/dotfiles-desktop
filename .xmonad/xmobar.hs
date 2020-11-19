Config {
    position = Top,
    font = "xft:Iosevka:style=Regular:size=12:antialias=true,M+ 1p:style=regular:size=12:antialias=true,siji:size=13:antialias=true", -- siji converted to ttf
    bgColor = "#0F0F0F",
    fgColor = "#C2C5C6",
    border = BottomB,
    borderColor = "#171717",
    borderWidth = 1,
    lowerOnStart = True,
    hideOnStart = False,
    overrideRedirect = False,
    allDesktops = True,
    persistent = False,
    commands = [
        Run MultiCpu [
            "-t", "<fc=#9C4A4F></fc> <total>%",
            --"-t", "<fc=#9C4A4F>cpu</fc> <total>%",
            "-L", "10",
            "-H", "70",
            "--high", "#FFB6B0"
            ] 10,
        Run MultiCoreTemp [
            "-t", "<fc=#9C4A4F></fc> <avg>°C",
            "-L", "50", "-H", "80",
            "-h", "red"
            ] 10,
        Run Memory [
            "-t","<fc=#9C4A4F></fc> <usedratio>%",
            --"-t","<fc=#9C4A4F>mem</fc> <usedratio>%",
            "-H","3000","-h","#FFB6B0"
            ] 10,
        --Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "<fc=#9C4A4F></fc> <fc=#C2C5C6>%F, %a</fc> <fc=#9C4A4F></fc> <fc=#C2C5C6>%H:%M</fc>" "date" 10,
        --Run Date "<fc=#9C4A4F>[</fc> <fc=#C2C5C6>%F</fc> <fc=#C2C5C6>%H:%M</fc> <fc=#9C4A4F>]</fc>"  "date" 10,
        --Run Network "eno1" ["-t","<fc=#9C4A4F></fc> <rx> KB/s <fc=#9C4A4F></fc> <tx> KB/s"] 10,
        Run Network "eno1" ["-t","<fc=#9C4A4F>down</fc> <rx> KB/s <fc=#9C4A4F>up</fc> <tx> KB/s"] 10,
        Run Com "getMasterVolume" [] "volumelevel" 1,
        --Run Com "getMasterVolumeNoIcons" [] "volumelevel" 1,
        Run Com "getRedshift" [] "redshift" 60,
        Run MPD ["-t",
            "<fc=#9C4A4F></fc> <title> - <artist> [<lapsed>/<length>] <statei>",
            --"<fc=#9C4A4F><title></fc> <fc=#C2C5C6>-</fc> <fc=#9C4A4F><artist></fc>「<lapsed>/<length>」"
            "--", "-P", "<fc=#9C4A4F></fc>", "-Z", "<fc=#9C4A4F></fc>", "-S", "<fc=#9C4A4F></fc>"
            ] 10,
        Run StdinReader
        ],
    sepChar = "%",
    alignSep = "||",
    template = "%StdinReader% || %mpd% | %volumelevel% | %multicpu% | %memory% | <fc=#FFFFCC>%date%</fc> | %redshift%"
    --template = "%StdinReader% || %mpd% | %volumelevel% | %multicpu% | %multicoretemp% | %memory% | <fc=#FFFFCC>%date%</fc> | %redshift%"
}
