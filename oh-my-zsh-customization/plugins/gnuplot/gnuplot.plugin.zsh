# Use gnuplot to plot something and display it right inside the terminal
# using `imgcat`.
#
# Examples:
#
#     plot "sin(x)"
#     cat data.txt |plot
#
alias imgcat="~/.iterm2/imgcat"
function plot() {
  plot_expression="$*"
  [[ -z $plot_expression ]] && plot_expression="'<cat'"
  gnuplot -e "set term png; plot $plot_expression" |imgcat
}

