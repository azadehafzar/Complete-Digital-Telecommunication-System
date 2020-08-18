% source/source encoding/huffman_decoding.m
%
% This file is a part of:
% Azadeh Afzar - Complete Digital Telecommunication System.
%
% Copyright (C) 2020 Azadeh Afzar
% Copyright (C) 2020 Mohammad Mahdi Baghbani Pourvahid
%
% GNU AFFERO GENERAL PUBLIC LICENSE
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU Affero General Public License as published by
% the Free Software Foundation; either version 3 of the License, or (at
% your option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
% Affero General Public License for more details.
%
% You should have received a copy of the GNU Affero General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
%
% ZLIB LICENSE
%
% Permission is granted to anyone to use this software for any purpose,
% including commercial applications, and to alter it and redistribute it
% freely, subject to the following restrictions:
%
% 1. The origin of this software must not be misrepresented; you must not
% claim that you wrote the original software. If you use this software
% in a product, an acknowledgement in the product documentation would be
% appreciated but is not required.
%
% 2. Altered source versions must be plainly marked as such, and must not be
% misrepresented as being the original software.
%
% 3. This notice may not be removed or altered from any source distribution.
%

function decoded_msg = huffman_decoding(unique_symbol, code_word, bit_stream)
    % INPUT:
    %   unique_symbol: string of the unique symbols.
    %   code_word: cell array of code to represent each probability of the symbols.
    %   bit_stream: message bit stream that has to be decoded.
    % OUTPUT:
    %   decoded_msg = decoded message.

    decoded_msg = [];

    % minimum code word length.
    i_min = min(cellfun('length', code_word));

    % bit stream pointer.
    ptr = 1;

    for i = i_min:length(bit_stream)

        if isempty(find(strcmp(code_word, char(bit_stream(ptr:i) + '0')), 1)) ~= 1
            ind = find(strcmp(code_word, char(bit_stream(ptr:i) + '0')), 1);
            decoded_msg = [decoded_msg char(unique_symbol(ind))];
            ptr = i + 1;
            i = i + i_min;
        end

    end

end