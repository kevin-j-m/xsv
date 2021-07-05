# Xsv Changelog

## HEAD (will become Xsv 1.1.0)

- Drop support for Ruby 2.5, which is now EOL. Supported Ruby versions are MRI 2.6 and up, latest JRuby, latest TruffeRuby
- Some internal cleanup

## 1.0.4 2021-07-05

- Support for custom date/time columns

## 1.0.3 2021-05-06

- Handle nil number formats correctly (regression in Xsv 1.0.2, #29)

## 1.0.2 2021-05-01

- Ignore phonetic shared string data (thanks @sinoue-1003)
- Throw ArgumentError when `Workbook.new` is called unintentionally

## 1.0.1 2021-03-18

- Allow passing a block to Workbook.open
- `parse_headers!` returns self to allow chaining (thanks @senhalil)

## 1.0.0 2021-01-26

- Xsv no longer depends on native extensions, thanks to a pure-Ruby XML parser

## 1.0.0.pre.2 2021-01-22

- Reduce allocations in XML parser
- Return strings with the correct encoding
- Handle XML entities

## 1.0.0.pre 2021-01-18

-  Switch to a minimalistic XML parser in native Ruby (#21)
-  Ruby 3.0 compatibility
-  Various internal cleanup and optimization
-  API is backwards compatible with 0.3.x

## 0.3.18 2020-09-30

-  Improve inline string support (#18)

## 0.3.17 2020-07-03

- Fix parsing of empty worksheets (#17)

## 0.3.16 2020-06-03

- Support complex numbers (#16)

## 0.3.15 2020-06-02

- Fix issue with workbooks that don't contain shared strings (#15)

## 0.3.14 2020-05-22

- Allow opening workbooks from Tempfile and anything that responds to #read

- Preserve whitespace in text cells

## 0.3.13 2020-05-12

- Add Sheet#hidden?

- Clean up code; get rid of some deprecation warnings

## 0.3.12 - 2020-04-15

- Accessing worksheets by name (texpert)

## 0.3.11 - 2020-04-03

- Backward compatibility with Ruby 2.5 (texpert)

## 0.3.10 - 2020-03-19

- Relax version requirements for dependencies

## 0.3.9 - 2020-03-16

- Fix an edge case issue with row_skip  and empty rows

## 0.3.8 - 2020-03-11

- Improve compatibility with files exported from LibreOffice

- Support for boolean type

## 0.3.7 - 2020-03-05

Reduce retained memory, making Xsv the definite performance king among the
Ruby Excel parsing gems.

## 0.3.6 - 2020-03-05

Reduce memory usage

## 0.3.5 - 2020-03-02

Fix a Gemfile small Gemfile issue that broke the 0.3.3 and 0.3.4 releases

## 0.3.3 - 2020-03-02

Intial version with a changelog and reasonably complete YARD documentation.
