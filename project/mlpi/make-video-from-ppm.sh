printf '%s\n' myimage-*.ppm | sort -t- -k2,2n | sed "s/^/file '/; s/$/'/" > frames.txt

ffmpeg -y -f concat -safe 0 -i frames.txt     -vf "setpts=N/20/TB"     -c:v libx264 -crf 18 -pix_fmt yuv420p     mlpi.mp4

rm frames.txt

