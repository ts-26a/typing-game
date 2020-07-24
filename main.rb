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
    while i != (word.length-1)
      i += 1
      key = STDIN.getch
      all += 1
      if key == word[i]
        print key
      elsif key == "\C-c"
        flag = true
        break
      else
        miss += 1
        i -= 1
      end
    end
    puts
    break if flag
  end
end


puts "miss: #{miss}"
puts "press: #{all / result}/s"
