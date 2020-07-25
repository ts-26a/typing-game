#!/usr/bin/env ruby

require 'io/console'
require 'benchmark'


words = [
  "apple",
  "banana",
  "gorilla",
  "require",
  "first",
  "second",
  "just",
  "like",
  "does",
  "the",
  "get",
  "when",
  "while",
  "astronaut",
  "standard",
  "keyboard",
  "mouse",
  "personal",
  "computer",
  "vim",
  "emacs",
  "print",
  "dictionary",
  "size",
  "game",
  "word",
  "excel",
  "powerpoint",
  "insert",
  "replace",
  "visual",
  "backspace",
  "enter",
  "return",
  "if",
  "else",
  "delete",
  "home",
  "end",
  "tab",
  "capslock",
  "shift",
  "control",
  "down",
  "upstairs",
  "downstairs",
  "can",
  "may",
  "should",
  "must",
  "might",
  "will",
  "would",
  "could",
  "i",
  "you",
  "he",
  "she",
  "they",
  "arrow",
  "narrow",
  "excuse",
  "press",
  "item",
  "without",
  "within",
  "with",
  "translate",
  "sub",
  "command",
  "unix",
  "linux",
  "osx",
  "windows",
  "each",
  "array",
  "string",
  "integer",
  "char",
  "list",
  "tuple",
  "set",
  "fix",
  "lint",
  "ruby",
  "python",
  "java",
  "javascript",
  "go",
  "rust",
  "kotlin",
  "swift",
  "terminal",
  "shell",
  "fish",
  "bash",
  "execute",
  "input",
  "output",
  "hundred",
]


miss = 0
all = 0
flag = false

result = Benchmark.realtime do
  while
    word = words.sample
    puts "\e[36m#{word}\e[0m"
    i = -1
    wl = word.length
    print "\e[2m#{word}\e[0m"
    while i != (wl-1)
      i += 1
      key = STDIN.getch
      all += 1
      if key == word[i]
        print "\r#{word[0..i]}\e[2m#{word[i+1..wl]}\e[0m"
      elsif key == "\C-c"
        flag = true
        break
      else
        # \e[31m
        print "\r#{word[0...i]}\e[31m#{word[i]}\e[0m\e[2m#{word[i+1..wl]}\e[0m"
        miss += 1
        i -= 1
      end
    end
    break if flag
    puts
  end
end


print "\e[2K\e[1A\e[2K\r"
puts "miss: #{miss}"
printf "press: %.5f/s\n" %(all / result)
