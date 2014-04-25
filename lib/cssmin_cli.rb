# Copyright (c) 2014, Jan Ferko <jan.ferko3@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# 3. Neither the name of copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software
# without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'cssmin'

# = CSSMinCli
#
# Command line runner for CSSMin library.
# For more details on CSSMin, please check http://github.com/rgrove/cssmin
#
# Author:: Jan Ferko (mailto: jan.ferko3@gmail.com)
# Version:: 1.0 (2014-04-24)
# Copyright:: Copyright (c) 2014 Jan Ferko. All rights reserved.
# License:: New BSD License (http://opensource.org/licenses/BSD-3-Clause)
# Website:: http://github.com/iref/cssmin-cli
#
module CSSMinCli

  # Runs minifier for given options.
  #
  # Currently supported options are:
  #   source - CSS source file
  #   inline - String containing CSS
  #   destination - File, where to store minified CSS. Default is stdout.
  #
  # Returns true if css was successfully minified and stored,
  # otherwise false.
  def self.run(options)
    destination = resolve_destination(options[:destination])
    source = resolve_source(options)

    return false unless source

    minified = CSSMin::minify(source)

    destination.write(minified + "\n")
    destination.close
        
    return true
  end

  # Resolves CSS source for given options.
  # Inline option has precedence over source option.
  # 
  # Supported options are:
  #   source - Path to CSS source file
  #   inline - String containing CSS
  #
  # Returns string, that contains loaded css from source or 
  # nil if invalid options hash was provided.
  def self.resolve_source(options)
    if options[:inline]
      options[:inline]
    elsif options[:source]
      IO.read(options[:source])
    end
  end

  # Resolves destination where minified CSS
  # should be stored.
  #
  # Params:
  # destination - path to file, where minified css should be stored. Defaults to STDOUT
  #
  # Returns opened IO object.
  def self.resolve_destination(destination)
    return $stdout unless destination
    File.open(destination, "w")
  end
end
