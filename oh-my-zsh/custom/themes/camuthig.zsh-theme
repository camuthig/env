# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Format for BitBucket updates alert
parse_bb_alerts () {
        if [[ ! $(command -v liza) ]]
        then
            echo ""
            exit
        fi

        if [ "$LIZA_ENABLED" != true ]
        then
            echo ""
            exit
        fi

        local COUNT

        COUNT=$(liza updates --count)

        if [[ $COUNT > 0 ]]
        then
                echo "%{$BLUE%} [BB]"
        else
                echo ""
        fi
}

MODE_INDICATOR_VIINS="%{$BLUE%}[INSERT]"
MODE_INDICATOR_VICMD="%{$RED%}[NORMAL]"
MODE_INDICATOR_REPLACE="%{$BLUE%}[REPLACE]"
MODE_INDICATOR_SEARCH="%{$BLUE%}[SEARCH]"
MODE_INDICATOR_VISUAL="%{$BLUE%}[VISUAL]"
MODE_INDICATOR_VLINE="%{$BLUE%}[V-LINE]"

# Prompt format
setopt PROMPT_SUBST
PROMPT='
%{$GREEN_BOLD%}%n@%m${MODE_INDICATOR_PROMPT}%{$WHITE%}:%{$YELLOW%}%~%u$(parse_bb_alerts)$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
%{$BLUE%}>%{$RESET_COLOR%} '
RPROMPT='%{$GREEN_BOLD%}$(git_current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}'
