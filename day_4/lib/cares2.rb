# Define the directions for searching
DIRECTIONS = [
  [0, 1],   # Right
  [1, 0],   # Down
  [0, -1],  # Left
  [-1, 0],  # Up
  [1, 1],   # Down-Right
  [1, -1],  # Down-Left
  [-1, 1],  # Up-Right
  [-1, -1]  # Up-Left
]

def count_xmas_occurrences(grid, word)
  rows = grid.length
  cols = grid[0].length
  word_length = word.length
  count = 0

  # Helper method to check if the word exists in a specific direction
  def word_exists?(grid, word, start_row, start_col, dir_row, dir_col)
    word.chars.each_with_index do |char, i|
      r = start_row + i * dir_row
      c = start_col + i * dir_col
      return false if r < 0 || r >= grid.length || c < 0 || c >= grid[0].length
      return false unless grid[r][c] == char
    end
    true
  end

  # Iterate through each cell in the grid
  (0...rows).each do |row|
    (0...cols).each do |col|
      # Check all directions from the current cell
      DIRECTIONS.each do |dir_row, dir_col|
        count += 1 if word_exists?(grid, word, row, col, dir_row, dir_col)
      end
    end
  end

  count
end

# Example word search grid
# rubocop disable Layout/LineLength
grid = [
  "XXXMMSAMXXMASXASAMMSMMSAAMXMAXSAXMSXMXSAXMMXXXXMXAXXXMASMMSSSSSMMMSMSMMSMSMSMMSXMXMMSMMMMAMXSMMMMSSXMASXSMAMSMAXMAMXSXAMSSMSSSMXSMSXXXXAXMMM".chars,
  "AMSMMASAMXXXXAXMAXAAMSAXXMXAMAMXAMMAMAMMSMSMXXASXSMMSMMSAMAAAMXMAMAAMMMSASXXMASAMXMMMAMXSAMMMAXMMAMAMASAMXASAMMMSAMXMMMAAAAAAAMASMXMSMSMMSAM".chars,
  "MAAAMAXXASMMASASMMSSSXAXMXSAMASMSMMSMAXAAAAAMSMMAMXAAAAXAMMMMMASASMSMMAMAMSXMASAMMXASAMXSASMSSMSMSXSMAMXMSXSASAXMAMAAAXMSSMMSMMASAMXSAAAASAS".chars,
  "XSMSMSSMXAAMAXMASMXMMMMSAMXXSMSAMXAMSSSSMSMSMAAMAMMXSXMMSMASASXSXSXMAMXXSAMXMASXXASMSASMSAMAXMAAXMAMMSMSXMXSXMASXXSXMXSAMXMAMAMXSASAMXMMMSXM".chars,
  "XXSXXAAXSSSMSSXMMMAXMASMMMMXMAMMMMXXAMAXAAAAMMMMASAAXASAXMASASXSASASXMAMAASMSAMAMXSMSAMXMAMMMMXMSMMMAMXMAMAMAMSSXMAMMSAMXAMMMAMASAMMSASAMXAA".chars,
  "XMASMMSMMAAAXXXMASXMMMMAAXXAMAMAXXMMAMMMSMSMSXXMSMMMSAMASMAMAMAMAMAMSMSSSMSXSAMXMASXXMAMXAMXAMAXXAXMAMMSAMAMAXAXAAAAMAMMSSXSXXMAMAMXMAXASMMM".chars,
  "SMAMXMAXXAMMMMMXAXAXSSSSSSSXSSSXSASXMMAAAAAAXMMXAXXAMXMSMMSSXMXMAMAMXMAAAAXASAMXMAMXMAAMXXXMAMMSSMMMMSASXSXSAMMXXMXSXAXMAMASAMSSSMMMXMMMMAXA".chars,
  "XMMSSSMSSMSAXAAMSSSMMAXAAAAAXAAASAMXASMSSSMMMAMSMMSAMXXAMAAXAMXSXSAAXSMXMMXMXAMXMMSMAMAMAASXXSAAXXMAMXMXXMAAXMMASMMMMXXMAMAMAMAASAAMASAMXSMM".chars,
  "MAXAXAAAXXSXXMXSAAAMMMMMMMMMMMMMMAMSMMMAAAAASXMAAASAMMSMMMSSMMAMMMMMXMMXSAMSSSMXMMAAASAMSMSAASMSSXSASMSSMMMAMSXXXAAMSSMSMMXSMMMMMSMSASXSAAAM".chars,
  "AAMXSMMMXMXMASXMMXMMSXMMXMAMAAXASAMAXAMMSMMMMASMSMSXMAMXAXMMMAXXAAASMSAXMASAAAMMXSASXXAXMAMMMMMAMXSASAAMXAMMASMSSMMSAAXAASMMMASMMAXMAMAMMSMM".chars,
  "SMSAXAXAMSAMSAAMAXMASASXMMXMSMSXSXSMSXSXMXXXMXMXAMMMMXMSASXASMSSSXSAAMSSXMMMSMMAXSAXXSMMMMMMXXXXXAMAMMASXXSMAMAAAMSMMSMMXSAASASAMSSMAMAMAXAM".chars,
  "MAMASAMXMSASXSXMASMASMMAMMAMAAXMSASXSMMMXMAMSMSXMAMAMSMSSMMXSAAAXXMMXMASAAMAMXMSMMASMMSASAAMSSSMAMMSMMAXAAXMAMMMXMXAXAAXASMMMMXAMMAMAMAMMSXM".chars,
  "MMMMMXMSMMXMAXXMAXAAMASXMSASAXSAMAMMXAMSSXSAAAXAXMSMMAMSAMAMMMMXMXXXXMASMMMAXMXMSMAMAAXXMSXSAAAXXMAAMMMMAMSMXXASASMSSSSMXSXMASXSMSAMXSASMSXS".chars,
  "MXAAAXMAMXSMMMMMMSMXSXMAXXAXASMAMAMAASAAXAXSMSSMMXAXSSXSAMXXAXSSSMMSAMAXXAMAXSAMAXSSMMSSMMMMMMMMXMXXSAMSAMXMASXSASAAXMAXAXASXSAAAMMSMMASAMXM".chars,
  "XSSMSSSMSMMAMXMAXAMMAASXMMSMMMMAMXASAMMMMAMAXXAAASAMXMASMMSMMMSAAAAMXMMMSXSXXSASMXMAXMAAAASMSAXAMMMASAMSAMAMMMMMMMMMMSMMSSMMAMXMMMMAASXMMMAS".chars,
  "AMAMAXXXAAXAMXXXXMSAMXMAAAXAXASMSXAMXXXXMAXXMMSMMSMSSMAMXAAAAMMXMMMSMXAAXMAXMXXMXMSASMSSSMSASAXSASAAMAMSAMAMAAAAMSMMAMAAAAXMXMSXAAXMMMAAMSAS".chars,
  "MSAMMMMSMSSMMSSSSMAXXASXMASXSMSAAXXXMAXSMSSSMMASXXAAMAMXMMSSMSASXSXAMSMMXAMXMMSXMAXASAMAXAMXMXAMMXMSSSMSASMSSSSSMSAMMXMMSSMMAMAMSMSMMSMMMSXM".chars,
  "XSXMAAAAAMXXSAAAASASMXMXMXMAAAMXMMXMAMXSAMAAXXAMMMMMSMSMMMMMMMMMAASAMAMXXSASAASAXMMMMMMAMXMSSMSMSMXXAMAMXMAAAXAXASAMMASXMXAXXSMXAMAXMAXMMMAM".chars,
  "XMAMSSXMSMMMAMMMMMMMXAMXAAMSMMMAXAXSSMAMAMXMMMSMSASAMAAAASASXMMMXMSXMSXSXXASMASMMXXXAAMXSSMMAAAAAAMMMMAMSMMMSMMMAXXMSAMASMSMASXSASAMSXMSASAM".chars,
  "MSSMMMMMAAAXMXSAMMSMSMAMSXXXAMSMSXMAMXASXMAXXXMASASAMSMSMSAMMXSAMXMMMMMMAMMMMAMMSAMMSMMAXAAMMXMSMXMMAMAAMAMXMXXSSMMMXMMAMAXMAMAXAMAXMMASASXS".chars,
  "MXMXSAAXSSMSMAXASAAMAMAMXMMXSMMXSXXSXSXSMSMSXMMMMXMXMXAAAMAMSASAMAMAAAAMAMAXMMSAXMAXAMMMSSMMAMMAXXASXSSMSAMAXAXMAASAAAXSMMXMMMMMXMXAAAXMAMAS".chars,
  "XASAMXMMMXMAMMXMMXXSMXAMAAMAXAAASAMXMMMSAASAASAMXAMASMSMSMMXMASMMASMSSSSMSMSMXMASMXSASMXAMXMMMMAMMXMXXAASAMASMSSXMMMXMSAAXXXXAAXXMMSMSAMXMSM".chars,
  "SMMMSAXAMMSAMSASXSMAMSMSMSMASAMXSMAAAXASMMXSXMAASXSASAAMXMXXMXMMSASAMXMMMMXSXAMAMXAMASXAMMSASASXSXMSMMMMMAMXAXMAMSMSMSMXMXMAMSMMASAAAXXMXMAM".chars,
  "AXAXXMXASAXXMSXXAAMMMAAAAMMMMAMXSXSSSMMSASXAMMMXSXMASXSXMMSMXSAMXAMMMAXMASAMMXASMMXMAMMMMASXMASAAMXAAAXXXSMSXMMAMAASXSAMXAMMXAMMAMSXMXAMXMAM".chars,
  "MSMSAAMXMAXMMSXMSMMXSXSSXSAMXAMMSAMXMAMSAMXMAASXXAMAMAMXSXMAAMMMMXMSSXSMAMAMAXAMASXMASMXMXXAMXMMMASXMMSSXMAAXMSMSMSMAMAMSSSSSMSASMXXMSAMXSAS".chars,
  "XAAMXMASMMAMXMAAAAMAXAAAXSASXSMXMXMAMMMMXMXXSMSMSSMASMMAMAMMMXASXSMXMXMMASMMSAASAMXSAMXAXMMMMAXXMMASAXAXAMSMMMAMAXXMXMAMAAXAXASAXAXXAAAXMMAS".chars,
  "SMXMAXMAAASMMSSMMXXAMSMMMSAMAXMXMSSMXSASXMMMXXSAMASAXXMXXAMAMXAXAXMAMAMMASMAAMMMMMAMASMSSMASMMMXXMASXMASMMMAXMAXMSSMXXMMMXMAMMMMMMMAMSMSSMAM".chars,
  "XSSXSSSMMMMAAAMMSAMSXXAXXMSMAMSMMAAMASMSAAAAMAMAXAMMSMSMSMSASMSMSMSASXXMXSAMSXMASMMSMMXAXMASASXSXMAMAAXAMASAMXXSXAAXSMMMSMMXAXAAAAAMMAAXAMSS".chars,
  "MXSAAAXXSXMXMASAXMAXAMXMSXMMMMMXMXMMMXMSXMMSSXXAMSSMAXAAAXMASAAAAASAMAASAMAXMMSAMXMMASMMSMMSAAAXXMAMMASMSASASXXAMSSMAAXAMAMMXSSSSSMSAMXSMMAX".chars,
  "XAMMMMMSAAASXMMXSXSMXMAAXASXMASMSSMXXMXSMMMAMAMSSMAMXSMSMSMMMMMSMXMMMSMMASXMAXSSSXXMASAXXAAMMMMMMMSXSASXMAMMMMXSAMXMSMMMSAMSMMMXMXASXSXMAMXM".chars,
  "MMMXXXXMMSMXASMXMAXAMXSMSAMASXSAAAXMXMXMASMAXAAXAMAMMMXAMXAAAXXMMXMXMAMMAAXSMMMAMMXMASMMSMMXSAMASXXAMXSAMSMSAMMAAAXMAXMAXXSXASMSSMXMASASXMAS".chars,
  "AASMMMSXMXXSMMMAMAMAMMAXXAMAMSMMSMMSMSMSAMMSSMMSAMXMAMSSSMMMSXMXSAXSAMXMMSMAAAMAMSASAMXMXAAAXASASMMXMAXXMAMSAMAMMMMSMSMMSMMMMMAAAXMXMSAMMSAA".chars,
  "XXAAAAXXMXMMMASMMMSSMAMSXMMMMXXAMXASMSAMXSAXXXMAMXXSXMAXSAMXMXMASMSMXXMASMAXMMMXMMAMXAAMMSMMSAMMMAXSMSSMMAMSXMMSAAAAMAMMAAMMMMMMMMMAAMAMAMSS".chars,
  "MSSXMSXXMAAASXSMAAMAMMXSMMAXXSMSSMMSAMSMAMASMMSMASXAMMSMSSMAMAMXXXXMAMMXMASMMSMSMMAMMSMSAMAXXAMXSSMSAMAMSMXXXAMMMMSSSSSSMSAAASXMAMXAMMAMXXAX".chars,
  "XAAMSAMSMMXASMXXMXSAAXXMAXMSXXAXSAAMXMAMXMXXAAXMASMMXAAAXAMSSXMSMSMXSMMXXAAMAAAAMXASAAAMASASMMMXMXAMSMAMMMSSMSMMSMXAAXAXAAMXMXASXMSASXAAMMSS".chars,
  "SMSMMASAASMMXXAXMAMXSMSMSAXAAMMMSMMSXMAXMMMSMSSXXXAXMSMSMXMMAMXAAAMMXAMXSSMMSMSMSSXSMMMMXMXXAASAMMAMXMSSXAAXMASAAAMMSMMMXMMSSSMMXAAAMXXMAAAM".chars,
  "XXAAMSMMAMAMAMMSSSXAAXAAMMAXXMMASAMXASXXSAAAMMMMAMSXXMAMXAXSMMSMMMSASAMAMAXAXXMAMAAMAXXSAMASMMMASXMXMAAMMMXSXMMSSXSAAAASMXMAAAXSMSMMMXMSMMXX".chars,
  "XSSMMMAXMSSMAXXAAXMAMXMXMXXMSXMAMMMSMMAASMXMMAAMAMXMSMMMSXXAXMXSAMMMSAMASXMMMSMSMSXSAMMAMMXAMXSXXAXAMMMSXSMXAXXXXMMMSSMSMAMMMMMMAAXAXXAAXMSS".chars,
  "XMASMSMMMAMXMSMMSMAAAASXXSAAMAMSMSASMMMMMSMASXSSMSAXXAXASMXMMAASXXAXXMSMSXAAAAAMXMXMASAAXSAMXMAMXMMXSAMXAMXSMMMAMSAAMAMXMSSMXSXMSMSSSMSSSXAA".chars,
  "MMAMXASXMAXAMAMAAXMMXXSAAXMASAMMAMASMSMMAXMAMMAAASMXSAMXXAMXXMXSASMXMXAAMXSMSMMXAMXAXXMASXSXXAAXMXSSMMSMAXAMAAXASMMMSASMMMXXMXAMXAAMAXAAMXMM".chars,
  "SMAMSMMXSASXSSMSXSXMSSMMMMXAXASMMMMMMAAMXSMASMMMMMMXMXASXSMSASMMAMAASXSSXAXXXXAMXMSXMSSMSAMSSSMAMAMAAAXMSMMSSMSXSAAXXASXSXAMMSMMMMMMSMMAMAXX".chars,
  "SMMXAAXMMASAAXMMASAMXAAXMASMSMMMXAXASXSMAXXAXXXMAMXAMXSMSAAXASAMXMSMMAAMMMMSAMSAMXSAAAAAMAMAMAMAMASMMMSXXAAAAAXXSMMSMSMAMMMSAAXAAAMXXXSASXSX".chars,
  "MAMXSMXAMAMMMMAMMSMMMXMASASMAXMASMSMXMAMMMMSSMMSAMSASMMSSMMMXMXXAAXXAMMMAMAAAXMASXSXMMSMSSMMSASMSAMAAXAMSMMSMMMXXMAMMAMAXMASMSSSSMSXMASAMMMM".chars,
  "MAMXMSXMAMXMMSMSXMMSAXXXMASASMSAMXAMAXAMSAMXAAXMMASAMASXXMASMMSSMSMSXXXXSMXMXMXMXXMASMMAAAAASAMAMXXMMMMAAMMXXMMMAMMXSASXMMXSAXXAMXSAMAMSMSAM".chars,
  "SASAAMMSMSMSAAXSAAAXMAXMXSXXMASAASMSMSMSSSSSMMXAMAMASXMMASASAAAXAAAASAMXMXSXSMSMMXSAMAXMSSMMMMMSXMMSAMXSMSMAMXAMASXASASXASAMMMXMMXSAMASAXSAS".chars,
  "SSSMSMAAAAAMSSXSAMMSXSXAXXXXMAMSMSAMAAXMXAMXAXSXMXSAMMASAMSSMMMMXMXMMXMAMMAAAAAAMAMASAMXAMXSXXAXAMAAAMMMXAMSMSXSASMXMAMMXMASAMSAMASAMXXMASAM".chars,
  "XMXAMMSMSMSMAMASXMAXAMMXMSMSMSMMMSMMXMSXXSMSSMMASAXMASXMASAXAMMSAMAXAAMAMAMSMXXMMASAMXXMASASXMSSXMMSSMASXMMMMMAMASAMMSMAMSSMAMXAMASAMXSXXMAS".chars,
  "MAMXMAMXMMMMXXAMXMXMXMAAMAASXMASAMXMSMMMMMAMXASXMASXMSAMXMMSXMASASMSSSSSSSXAXAXSSMMAXXXMAMXSAXAMAMMMAMASAXAAAMAMXMXMAAXXAXAMSMSSMXSAMSAMXSAM".chars,
  "XSXSMMSMSAAAXMSMMAAXAMMXSMMMAMAMAMMMAAAAAMMMSMMMMMMAASMMASXMAMMXXAAAXXAXAMXSMXMAAASMMAXMAMMMAMXSAXAMAMXSMSSSSMMSXSSMSMSASXXMMAAXXXXXMAXXAMXS".chars,
  "XXAMXMAASXMSSXMAMSMSSSMAXMASXMSSXMXMMMMXXSMMAAAMAAMMMMXMXSAMXMXXSMMMSMSMMMMAASMSMMAAMAMSSMMXSXMSMSMSXSAXXAMMXAAXAXMAAAAXXMASMMMXMSMSMSAXXMMA".chars,
  "XMSMAXMXMMSXMASMMAMMAAMSMXXMAAAMXSMSMXMSMXAAMXSSSSSXSXMXASMMAMXMMAAAXXXAAAAMSMAXAMSAMAXAAASAXAAXAXAAXMAMMMSAXMMMSMMMMMMSMSMSMSMSAAXAAMMSMSXA".chars,
  "SAMMSXSAAXMASAMXMAMMSAMMASXSMMMMMXAAAASAMSMMXAXMAAXXMASMAMMMMXAASXMSSSSSMSXXMMMMXAMAMMMSMMMAXMMMXMXMXMXXSXMXSSXXAAMASXMMAAAMAAAMXMMMMXXAAAMX".chars,
  "SASAXXSSXMMXMXXMSXSAMAXSAMXAASAAMMSMSMSAMMXAMSMMMMMSXAAMSMSASXMXMAAXAXAAXMASXXAMSXSSMXMMMSMMMAXAMXAXASAMXASAAAXSASXASASMSMSMMMSMAXXAASMMSMSA".chars,
  "SAMASMMMXSSSMMMMAXMAMAMMMXSMMMSMSAXMXASXMSMSXMASAMXSMSSXAASAXXXXSMMMXMSMMSMMASMXMMAAAMMMAAAASMMSASMXAXAMSMMMMMMSAMMXMAMMASAMXAAMSMMXMSAAAAMM".chars,
  "MAMAMAXXXAAAXAAMXXSAMAMASMSXSXAXMXSAMMMAMMAMAXMSASAXAMMMMXMAMSMXMASXMMMXAMXXMMMAASMMMMXMSMSMSAMAXAMMMMSAMXXAXSAMASMSMAMMMMSMMSMAAAMXMSMMMXMX".chars,
  "MXMXMAMSMMSMSSSMMASXSMMMSAMAXXXMXXMMMAMMMMAMMMXSXMMMXSAAMASMMSAAXXAXAXMMMMXMXAXSMMAAAXXMXXXXSMXSMMXAAAMXMXSMSMASMMAAXSXXAAXXXXMSSSMAAMMXXSXM".chars,
  "SASMMSMSAAXAAAMASAMXAAAXMMMSMMMMXMSXSSSSXSASMSAMXSMAAAMAXAXAAXSSSMMASMMXSASMSSMXASMMMMXSAAMXMXMXAMSSSMSASASMXXAMAMSMSMMSMSSMSXMAMXMMSXMSMMMA".chars,
  "SASAAMASMMMMMXSXMASASMMSAASAMMAMAXMAAXAMASAAXMASAMMMXMSSMSSMMXAMAAMMXMAAMASAAMAXAMXMAMMSMMMAXAASAMXAXASXMASAMMSSSMXSMAAAMMAAAXMASAMSMXMAAASM".chars,
  "MXMMXMAMASXXAXMAMXXAMAAMMMSASMSSMSMMMMAMAMXMASAMXSMMSMAAAXXASXSSXMMXXMMSSSMMMMSMMXAMAXAXAAXMSMMMXAMXMXMMMXMXMAMMXXMAXMXSMSMMMSXAXAXAAAMSXMXX".chars,
  "MASAXMASAMAMXXXAMXMSMMMMMXSXMAMAXAXMAAXMXSXMMMMSAMAASMSMMMSMMAMMASMMMSAAXAASXAXMAMMMMMMMMMXXAMAXASXSMXMAMASMSMXXXMSSMSAXAMSAAXMMSSSMSMXMMSSS".chars,
  "SASAMXAMMSAMSSMSSSMASAAXXAMAXSSMMMMSASMSAMAXMAXMAMMMSAAAAAXXMXMSAMAAAMAMXSMMMAMSAMXASASXAXMASMXSAMAASXSMSAMAAMXMSAAAAMASASMMMXMMAAAAMXAAMXAA".chars,
  "MAMMXMASMSAXXAXXAMXAXMMMSSMMMAAMMXASMMXMASMMSSMXAMSAMXMMSMMXMXMMMSSSMXSSMMSSXMASAXSAMAXMXXMXMAXMAMSMMXAAMAMSMMAAAMMMSMXMMMAAMSSMMXMMMXMXMMSM".chars,
  "SSMSXSASASMMSSMMAMMMSAAAAAMXXMAXMMMXAXSSMMAAAMMSMSMSSSMXXAMSSSMAMAMAXAMAXAXSAMXSAMMSMSMSSSSSMMMMAMXAXMMMMAMXASMSSSSXMXMMMSSMSAXAXASXSMSAAMAS".chars,
  "SAAXAMAMAXMAXAMSSMAXSXMXXSASMXSMAMASMMXAASMMMSAAXSXXMASAXAMXAASMMASAMXSMMMSSXMAMXMAXSAASAAAXAXASASXMMMXAXMMSAXAAAXMASMMAAAAMMMSMMMAAAAMMMMAS".chars,
  "SMMSXMAMSMMSSMMAASMMMASXMAMAAAXSAMXAXMSSMMXXSMMSXMAAAAMMSSSMSMMMMMMXSAXXAXAMAMXSMMXSXMXMMMMSXSASXSXSASXMASASXMMMSMSAMASMSSMMAXAAAXMMMMMXSMSM".chars,
  "XSAMXMXSXAAAAXMSMMXASAMAAMXMMAMMXMAMXXAAASAMXAMMXSAMMSSXAAMMASASMMAMMMSSSMXXAMXXAXMAMXXMXMAAMMAMASASASAMXMMMXMXAAXMASAMXXAXSAMXSSSXSXXMAMXAX".chars,
  "MMMMXMXMXMXMMMMXXMMMMAXAMXSXSSSSXSAXSMSSMMMASMMMAXASXAAMMSMSAXMSAMXSAAXAMAMSMXMASMMSXMXXAXMSXMAMAMMMXMMSXMXSAMMSMSAASASMMMXMXXMXXMAXAMMMSSSS".chars,
  "XMASAMXXAMSMSSXSASAASMSSMMSAMAAAASXMXXMAXXMMMSAMXXSMMMSXAMXMMSMSXMAMMXXMMAMAASXMXAAMAMASMSXMASAXAMXMASMAAMAXASMAMXMASAMAAAMMMMMMAMAMSMMSAXAM".chars,
  "MXAAAAXMMAAAAMAXAMXMXXAASAMXMMMMMMMSMMAMSSXAASMSAXMAAXXMASAMXAASXMASXSMXSASXMXAXSMMMAMAAXSAXMMMXAXXMASMSSMASMMMASMSAMXMSMMSMAAAXAMXXMASMMMMX".chars,
  "AMASAMXAXMMXMXAMSMSXMMMMMMMXSXMXXSAMASXMAXSMMMAMMAXSMAAXXSASMMXMASAXAAXASASXXXMMSAMSXSSMMMAMSAMSAMXMAXXAMXAXMASXXAXXAAMASXAXSSMSMXSAMXMAAXXM".chars,
  "XAXXXAXSSSSMMMSSMAAASAMXMSAXMASXMMXSAMXMSMMXSMAMXMAAXXMAXMMMASXMMMSMSMMMSXXMMXSAXAMAXMAASMSMSAMAAAAMASMMXMAMSMMASXSAMXMAXXMMMAMSXAAAXAXSMSMA".chars,
  "MSAMMXMMAMXAAAXAMAMMMXSAAXMASMMASAAMMMSAXAMAXMXXAXSXMMXMMASMSMAXSAMXXAAAXMMXMAMAMSMMMMSMMAXMXXMMSSSMMSASXSSMXAXXAASASMMSSXSAMXASMMMSMSXXMSMS".chars,
  "XMASAASMMSSSMMSAMXXAXASMSMXXXASMMMMXASMMSMMMMASXSXMASMAMMMMMAMSMMASASXMSSXMAMAMXMXASMMMMMMMXXSAMMXMAXSAMAAAAMSASMMSAMMAAAMSXMSSXAAXXAXASASAA".chars,
  "XSAMXMSAAXMASAXASMMSAMXAXAMXSMMASXSSMSAXXMAMMAMAXMXXMSASASAAAAXASXMMSASAXASXSAXSASAMMAAXAASMMMASMMXXMMAMMMMSMMAXXAMXMMMMMMXXASASXMSMAMAMAMSM".chars,
  "XMSSMXSMMSXAMSSXMAAXMXMMMMAXMASAMXMAMSXMXMASMSMSMSMMMXXSASAXXSMXMAAXMMMASMMMSMSAMMSMSSSXSMXAXSAMMASXMSXSAMXXAMXMMAXMSASASMXMMSAMXXXMAMAMXMAX".chars,
  "SXAXMASAMXMMSAXMMMMMAAXAAXMMMMMAMXSAMSASXMAMXAAAAAXSXSMMMMXMSXXASMMMXXMAMXSXSSMAXAXMXAAMMASXMMASMAMAAAAXXAMMMMMXSXSAAASAAMAMXMAMXMSSMMAXAMAX".chars,
  "SMMSMMSAMAASMXSMSAAXSSMSSXSAASMSMAXXSMMAMAMSSMMMSMMASMASMAAMMASMSXMMMXMMMAMMMAMSMMXXMMMMXAMMASAMMSSMMMSMSMSASMSMMMAMXAMXSSXSASAMAMAAXSMSSMSS".chars,
  "XAXAXXMXMAMSAMSASMMMAMAMAMXXAXAMMMMMMXXXXXXAXAAMAMXMASAMMXXAMXMXSMSAAXSAMASASMMMASAASXSSMSMXXMASAMMXAXAAAASAXMAAASMMMXXXMAASASASXMXSMAAAAAAX".chars,
  "SSMMMXMAXMMMAMMMMSXXAAMMAMXMSMMXASAMXSXMMAMMSMMSAMAXAMXSASXSXMAXXASAMXMXSASMSXXSAMSSMASMAMXMASXMASXSAXMMMMMAMSMSMSXXMAMXMMMMXMAMMMSXXMASMMMS".chars,
  "XMASMASAMXASXMXSMMXSMMXSXMXAAAXSMMAXAMMXMAXMAAMSASXSMMMSASAXAMXSMAMMSAMXMASAXAMSXMXMMMMMAMAXXMAXAMMMSXASMMSSMAAMXMMMSAMMXMXMAMXMXMAXAMXAMXXX".chars,
  "XSAMSMMAXXAXAXAAAAAXASAMMMXXXXMAMMSMAXAAXMMSXSMSAMAAAXAMXMAMXMAXAMAASAMMMSMAMMMMXXXXASAMMSSMXMMMMXSAAMAMXAAMMSSMASAXSAMAAAASASASXMMSAMMSMMMX".chars,
  "MMMXASMASMSMAMSSMMXSAMMMXSAMXXSASAMSSSSMSAASAXMMSMXSMMMSMMAMAMAMMMMMXMMSSMXSAMAASMMSMMASAAAMXXSAMAMSSSXMMMMXAAAMXMSXSAMSXSMSAMAMAAXMXMAXMASM".chars,
  "SAMXAXMASAMMSMXAAAXMXMAMAMASAASAMMMAMXAMXMAMAXXAAXAMXXXAASXSMSASMAXXSMMMAMAMASMXSAASMSMMMSSMMAMAMXXAMXAXMSSMMSSMXXMMMAMXMMMMMSMSAMXSAMXXXAXA".chars,
  "SASAMXMXMAMAAMXMMMXXAXAMASASMAMXSAMXMMSMXSSMSMMSSSMMASXXXXAMXSASXMAMAAASAMXMAMXSSMMMAAXMMAAMAAXAMXMASXSSMAMXAMXXXSAAXAMXAXXAAMXAAXMMMSMSMMSM".chars,
  "SXMAXXAXMMMSSMASASMSMMSXMMASXXMAXXMSAXAAXAAAXSAMXAAAXSASXMMMAMMMMMSSSSMSXSSMSSMMXSAXXMASMSSMSMSMMMSMMAAAMASXMAAXMXMSSSSMSASMSSXMMMAAMAAAAAAX".chars,
  "XMSSXXSMMSAAAXMSAXAAMAXAMMMMMAMXSAXAASMSMMMMMMMMSSMSAMAMMAXMASAAAAAMXXAXAAAAAXMMASXSXAAMAAMXXXAAAMASXMMMMASAXMMSMSAMAAAAXXMAMXMXSXSSSMXMSSMS".chars,
  "SXAAMXMAAMMSMMMMXMSMMASAMASASXSMMXMMXAMAAAAAAXAAMAMAAMSSSSMAMXMSSMSSSMMMSMMMMMSMAXASAMXMMMSMXMMXMSASMSAXMASXMASAAXAMMSMMMSSSMMAMXAMAAAXXAMXX".chars,
  "AMAXMAMMMSXXASXXMAAXMASXMASASAAXXAAXMMSMSMMXMXMSSMMSXMAAXMAASXMXMAMXAMXAXXXXXAMMSMXMXSAAAAAASMSSXMAMASMSMMMMAMMMSMXSAXASAAMAAXSMMSMSMMMMAXXX".chars,
  "MMAMSASMMMASAMXMASXSMMXAMAMXMMMMMMSSMMAXXMXSMSMAXAAXAMMXMXSMMAXXMXMSMMXSXMMMMSAAXAMMSSMSMSSXXAMAXMAMXMXAMAAMSXAAAXMMASAMMSSSMMMAAXAAXSXSSMSM".chars,
  "XMAMMASAAMMMMMSAXMXMAMSMMSSMASXAAAAAAXMXMSXSAAMASMXSXMMXXAXMSMMMSAMAXSMMMSAAAXMASAAXXXMAMXMAMSMMXSASMMMMSSSSMXMSSXXMXMMMAAAAMASMMMMMSXAAAAAM".chars,
  "XSMSMXSMMXSAXAXSMMMSAMAAAXAMASMSMSSSMMSMAAAMAMMMXMASMAXMMSSMASXAMASMMMAAAXMMMXMASXMMMMSMSAMXMMAXXMXSXMXXAXMAMAMAXMXSSSXMMXMMMXMXXASMXMMMMSMX".chars,
  "MSAXMAXASASXMMSAMAAXASMSMSXMASAMAXAMXAAMSMSAAMAXASASMMMXAAAMAMMMSAMXASXMMSXSMXMAMXXAAAXXMXSSMSMMMMMSAMAMMSSSMMMASXXMAMMMSAMSXSMMSASMSASXMAMM".chars,
  "AMMMMASXMAMXSXSXSMSSXMAAMMAMAMAMMMSMMSSMXAMXSSXSASAMAMSMMSSMXSAMAMASXMASMSAAAXMASMSMSMMMMMMMAAMAXAASXMASXAXAAXMAMXMMAMAAMAXSAMSAAAXAXASXSASX".chars,
  "SAXXMMMMMSMMMAMAXAXMMMMMASAMAMSSXAXXXAXMAXSAMXAMMMMMAMAAMXXMXAMSASXMASAMAMSMMSSXSAMAMXMAAAASXMSSMMXSAMXSMXSSMMMASAXSASMSSSMMAMMSSSMMMSMAMASX".chars,
  "XXMSMAAXAXAAMAMXMAMMSAMXMSSSXSAAMMSMMMSMMMMAMMXMMAMSSSSSMMSXMMMSAMMSAMMMSMXMAXASMAMAMSMSXSMSAXAXSMAXMAMMMMMAMSSMSXXMMMAXAMXMMMAMXMAXSAMSMAMX".chars,
  "MAMASXXMSSSMSMSAMXXMAMXAXXMMXMXMAAAMAAAAAXSXMXXXMXMAAMMMXAMASXXMXMAMXXXAMASAMXMMSXMSASMXXXXMXMAXMMXSXSAMXAXAMXAXSXSASMMMAMSSMMASXSXMMAMAMXSX".chars,
  "MASASMSMMAMXXAXAMXXXMSMMMSAMXXMSMXSMMSSSMMSASAMSASMSMXAMMMSAMAXMMMMMSXMASMMAXAXAMXMMXXAMASMSMSSSSMAMAXMAMSMSXSAMXASAMSXMXMAAXSXSAAMSSSMMXASX".chars,
  "SMXXMXAMXMAXMSMSSMMMMAAAAXASMSMAXXMAXAXAXAMASMASMAAAMXMMMXMASMMSAXAASAXASAMXMMMMXAXSSMSMAMAAASMAAMXSASXSXMAMAXAAMMMAMAXSXSMSMMASMXMMAMSXMMMS".chars,
  "XXXMSSMSMSSSMXXMAXAASMSMSMXMAXXAXMMXMASXMMMAMXXMXMSMSASAAMAAMXAXMSMSSXMXSAMMASAASXSAAAXMAMSXSMMSMMAMASAMXMSMMSMMMXASMMASAMMMAXAXMAXMAMMMXAAS".chars,
  "SXSAAAAXMAMAXXMSMASMSMMAXMMMSMSSXSAASAMASXMMXSAXAXMASASXSAMMSMXXXAMAMMSASXMASXXXAMXMMMXMMMMMXXAXASAMMMXMSMXAXAASMMXXAXAMAMSSMMSXSXXMASXSSMSS".chars,
  "SASMXMMMMMSSMSMAXMMXMAMAMASXXAMAAMSMMASMMAMMAXMSSSMXMAMAXXXSAMMSSXSAAAMASMMMAMMSAMXXAMXMMAMMMMMSMMAXMAXSAMMMMSSMAMASMMMSMMAAXAMMSAAMASMAASAM".chars,
  "MMMSAASAMXAAAXSASXMASXMMSAMXMMMMMMXMSAMXXAMMMXXAMXXAMASMMSMSASAMMASXXAMXMASMAMASXMXMAXAAMASMAMMAMMXMMAMAMMXSAMAMMMXMAMAAXMSMMXSAXSSMASMSXMSS".chars,
  "MXAXSAMXSMSSSXXMXAMASMAAMAMXAXAXAMAMMXSASMSSSSMSXSAMSAMAMSAMAMMSMAMXSAMXSAMMAMXSASASXMSXSASXSMMASXSMMSSMXAAMMXAMXMMMXMSSXMAAASMMMAMXAXAXAMXM".chars,
  "MMSMXMAXXAMMXMAXSAMXSXMMMAXSSSMSMSASMAMXSAAXAAAMASXMMMSAMMAMSMMSMMXAAMSXMASMSSMSAMMSAAAAMAMMMMSASAAMAMXXMMXXSMSSSMAAAAMAMSSMMSAMMAMXAMXMAXAS".chars,
  "SXMAMMSSMAMAXSAMXSAMXAMSMMMMAAMAAXXXMASMMMMMSMMMAMAXAMMXXMXMAAXSASMXSAAXXXMAXAXMAMAMMMMXMAAAAXMAMXMMSSSMSSSMSXAAMXAMASMXMAXAAMMMMXSSMAMSMSAS".chars,
  "AAMSMAAAMXMAMMMSSXMMXMASASAMSMMMSMSMMAXXAAMXAMSMMSAMXSSSSMSSSXMSAMAMAMMXXXMASMMSXMSXSASXSXMMXXMAMXSXMAAXAAAAXMMSMSMSAMXSMXXMMSXMMAMAMSAAMMXM".chars,
  "MSMAMMSSMXMASAXMAMXXAXMSAAMMMMMMMASAMSSSSMSXSXXAAXXAAXAAAAAMMAXMMMAMXMXMAXMASMAMXAASAAAXMMSSSMSMXAAAXXXMMSMMMAXXAAMMXMAAXMASAXAMMSSXMMMXMMAX".chars,
  "MXXMMMXMAXXMSMSMXMXSASMMMXXAMASAMMMAMAAXAASAXASMMSMMMMMSMMXAXXMXXXXMAXAAMXMAXMAMXMMSXMMSXMAAAAXMMSSMMMMAXXAXXSMMMMSSMMSMAMXMASXMAXMMXSXMASXS".chars,
  "SMMSMMMXMMSMMAAAASASXSXAXMMXXAMASMSMMMSMMMMASASAAXAAAAXXXMSXSAMXSXASMXMSMMMSSSMSMAXMXMXXAMMXMMMXAMAAAAASMXMXMAXAMXMXAAAMAAXAAMAMSSMASAASXMAS".chars,
  "SAAAAAAMXMAAMSMSMMAMASXXSASXMSSMMXAAAAAXAAMXMASMMSSMMXXAAXAASASAMSMMSAAAAXAMAAAMAXAMAXSSMMSXSSSMSSSMSMSAMASAMMSSSMMSMMSSSSSMXSXMAXAXXSMMSMAM".chars,
  "SMMSSMXXASXSMAXXXMSMSMAMSXMAXAAXMSSSMSSSMMMAMMMAAAASMMXSMSMXSAMXMAXAXMSSXMXMSMMSSXMSMSMXMXMAXAAAMAXAXMXAMXMAMMAAAMMAXXXMAAXMMMMSMMSXMMXAXMAS".chars,
  "XAAXMMXMMMAAXAMXAAAXAMSMSASMMSAMXAAMMMAAXSSSSSSMMSXMMSAAAXXXMXMXMSMMSXXMASAMXXAXXMMAMXMAXAMSMXMSMMMMMMSXMASMMMMMMMSMSMXMMMMAMAAAXAMAMXMMMXSS".chars,
  "SMMSMAAXXMSMMMMMMMMSSMXXSXMXMMMSMMSMAMMMMMAMAAMMXXXAAMXMMMMXMAMAXAAXSAXSAMAXMMMSMXSAMSSXSASAMXXAAXAXAXMASMSXMAMMMXAAAAMXMASASMSSMMSSMXMXSMXS".chars,
  "XMAXMSXSAXXXMMMAAAXXMASAMSMAMMASXAXXXSSMAMXMMMMSAMMMMMMXMASASAXXXMSMXAXMASXMXAMXAAXAMAAASXSAMXMSSSXSAMMXSAMAMAMSSSMSMSAASMSXSXMAAXAMXXSAMXAX".chars,
  "SXSXAAMMXMXASASMSMSAMXMAMAMAXMAXXAMXXXAXXMASXXAMASXSAMXAMMMAMMMSXSAMMXMSAMMASMXMSMXMMMSMMAMXMAAXMMXMXSSMMASAMASXAAAMXXMAMXMAXAMSMMASXXMMMMXS".chars,
  "MAMMMMSSMXSAMASXAASMMSXMMMXSXMXSAMASMSMMMSMSMSSSMMXSMSSSSMMSMMASMSASMAMMSSMXMSAXAMASAMMAAXMSSSSMMSAMSAAASAMXSXSMMMAMMXXXMASAXSMMAMXXMASAASMA".chars,
  "MAMMMAXAAXMXMAMMMMMSMAASXMAXASAMXSXMAAXAXAAXAAXMAMXMMXXMAXAAAMAXASAAXAXXAXXXAMMSXSASASXMXASXAAXAASASMSSMMMSAMAXAXXMXSAAMMMSXAMXMAXAAAMMMMXAM".chars,
  "MSSXAMSMMMMAMAMAXAAAMSMMAMASXMAMXSAMSMSSSMSMMMMXAMXXXMASXMSSSMMSXMXMSSSMMSSMAMXMAMASMMAMSMAMMMMSMMMMXAMMAAXASMSMMMMAMSSMAXXMAMAMAXSXMXASMSSX".chars,
  "XAMMSAMXAAMASMSMMMSXMAXSSMAMMSMMAMMMXAXAMXMASMSSSXSAMMMAAAAXXMXMMAAXXXAXXAAXSMMMMMAMASXMASAAASAMXSMSMSSSMSSMMAAXAAMAMAXMXMAMMSAMAAMAMSMSAAXA".chars,
  "MSSMMAXMXXSASAAXXAAMXMAMMXAMAAAMAXSAMXSMSASXMAAAAAXMMAXMMMMSXMASXSMSASAMXSMMXMAXAMMSMXMXAMMSMXAMASAAMXMXXXXMMSMSXSSXMASXMXMMMAXMMXSAMAAXMMXA".chars,
  "AXAASAMMAAMAMMMXMASMSSXSASMMSSXSAXMMSXMASASAMMMSMSSXSAMSXSAMXMAXAAAXMMMSMMXXXASMMXMAMMSMSSMAXMAMAMSMSXMMSMSMAXXXAXXXMAMAXASASAMXSASMSMSMXXSS".chars,
  "SSMMMAXMMSSMXXSSMMMMXAAXAAAAMAMXMSMMSXMAMXMAXMXMXMMAXAXSAMMSMXSMSMMSMAXAASMSSMMASMSMXASXMAXAMXAMXXAMAAXAAAXMAXSMSMASMAMSMMSAMAXXMASAAMAXSAXA".chars,
  "MAXMMSMXMMAMSXMAAXXSMMMMSMSXSXSMAAAXSAMMXSMMMMAAAMMSMSMMAMASMAMMMAAXXASMXMAASXSAMAASMXSAXAMSSSSSMMAASMMSSXSASXSAMXXMSSXMAMMMMMMMMAMXMSASMAMX".chars,
  "AXMXMAXXMMAMSASXMMAXAASXMAMMMMSASMSMSAMAAMASASXSMMAAAAAXXMASMXMAXMXMMMMXSMMMSXMAMXAMMMMXMSSXAMXAASXMAXAMAASAMXMSMSMMXMASXMAAMASXMAMAXMXMMAAX".chars,
  "SMSAXXSMSSSMSAMXMXMMXMSAMMMMXAMXMAAASXMMMSASAMMAASXMSMXSAMASXSAMXSXMASXMXXAXMASMSMSMSSSSXMXMMMSSMMMSMMXSMXMAMSMMMXAXAMAMXMMXMASXXXMSMMMMXMXM".chars,
  "XAXXXSAAAAMAMMMMSAMXSAXXMAAMMSMSMXMMMXAAMMMMMMMMMXMAXAAXXMMSMSAMMSAXAMAMMSSMXXMAXAXAAASAMXXMXAXMMSXAXMASMMMAMAAMMMSXSMMXMSMSMASMSAAAAASMMXAA".chars,
  "MAMSXMAMMMMAMAAASASAAAXSSSMSAXMSAMXMXMMSSMXMAMXXAMMMMMMSMSXSXSXMASAMSSXMAXAXSSXAMSMMMSMMXMASASXMASXXMAMXAXSASXSMAAMXMAMXASAAMXMASMSMSMSAASXS".chars,
  "MAMAAAASMXSSSSMXMMMMMMMMAAAMASAXXXXAAXXAMXAASMXSASMXSAMXXMASAMSMXMASAAAMXMMMAAMSXMAXMAMXMAXMAXXMASMMSSXSSMSAMXAMXMMASAMXSMSMSAMMMAXAMAMMMMAA".chars,
  "SXMXXMXMAAMAAMXASMASXAXMMMMMAMMMMMSSSSMAMXXXXAAXMMMAMAXMSMAMAMXMASMMXSXMAMAMAXAAASXMSASAXXXMAMAMMSMAAAMAMXMAMSSMSSXASAMMMAMMSASXSXMXMAMAAMXM".chars,
  "AMSXSAMXMMMMMMMAASAXMXMXAAAMMXXAAMAAAXXXSSSXSAMXSAMMSSMMAMASAMXMAAAAAXAMASXSXSSMMMSASASXMMXMMSMSSXMMXSMAMAMAMXAAAXMAXAMAMAMXMAMAMAMXMSXMMXSX".chars,
  "MAXMASMXAAXASXXAMMMSMAXXXSAMXSSSSSSSMSSXMAAXSAAXSAXXAMASMXMSXXXMSSMMSXMMASAAAXAASAMMMMMAMSAMXAMXAMASMXXAXMMMMMMMMSASXMMSXMXAMAMXSAMXXMMXSAMX".chars,
  "XSSMAMXXAMXMMMMMXAXAMMXSMMXSAMXAXAMXXXMAMXMXSAMMSSMMASXMSAMXMMMXMAMSMASMMMXMXMMMMAMXAAMMAMASMSSMXMAXMAXSMSAAAMAXXXMXAMAAAMSSSMSMSXSXASAAMMSM".chars,
  "XMAAASXSMSAAASXSSSSSXSASAAAMXSMSMMMXMASMMASXMXMXMAMSAMXASMSAXSAMXMSXMAMAXAAXAMXMSMMSSSSXSSMMAAMMAMXXMSMXASMSMXSAMXASMMSSMMAAAXAAXASMMMMMSAAM".chars,
  "MSAMMSASASXSMSAAAAMXAMASMMMXSAMXAMXAMMMAXASAMMMASMMMXSMXMXXMMMXSXMMAMMXSMSMMMXAXAAMMAAXXMAMMMMMSMMMSAXAMXMAMAMXAXAXASXMAXXXSXMMSMXMAXSXMMXSS".chars,
  "AXASAXMMAMAMAMMMMSMMXMXMASAXMXMXAMSXXAXAMXSMMASASXAAMSMMXSMMAMXMASMSMAAMXMXMSSMMSSMMMMXSAMXSXMAMAAXMAMXMMMXMAMXMASAMAXSAMXMMMSXAXMSXMAMAMXXM".chars,
  "SXSMMSAMXMMXXMMXAMXMXMASMMMSMAXMAMAMSSMSAMXXSXSASXXSAXAMAXMSXXASMMAAMMMMASMXMAXAMXXXAXMAMSXMAMMXMMSSSMSSSMSXSMAMAMAXMXMAXXAAXMSMSAMSMXMSAMXX".chars,
  "XMXAAMMASMMSMSSMMMAXAMAMAAXAMAMMAMAXAMXAXAMAMXMAMXMAXXAMAXMAAMMSSMXAMXXSAXAAMAMSAMXSXXASMSASMMSAAMAXMXAMAAMAMXXMAXXMXXMXMSSMMMXMXXMAXMAMMSMS".chars,
  "MASMMXSASAAAAAXAMSMSMSSSSMSXMASASMMSAMXMMXSAAAMMMAAMSSXMSSMMSAAMXMMMSAXMAMSMSSMXASAMXMSMAMAMAASMSMASXMMSMMMAMXMSSSXMAMMAMXAMXSAMSSSMSMMXAAAA".chars,
  "AMAAAAMASMMMMMSAMAAAAAAMAAMXXSXAMAXSXMMXAASMMMMASXSAAAAMAAXAAMAMASAAMMSMAMXAMXASAMMSAXAMMMSSMMMAMAAMAAAAASMXSXAAAAMXAXSAMSXMASASAAAXSAAMSMSM".chars,
  "SXSAMSMAMXXXMXXMSMSMMMSMMXMASAXXSXMMMAXXMMSAMXMAXSAMXSSMSSMSSMMSASMSMMMMASMAMMMMAMXSXSASAXXAMXMXMMSSSMMSSMAASMMMSMAMXMSAXXSMMSXMMSMMXMAXMAMX".chars
]
# rubocop enable Layout/LineLength

# Word to find
word = "XMAS"

# Count occurrences of the word
result = count_xmas_occurrences(grid, word)
puts "Part 1: The word '#{word}' appears #{result} times."

# Define the directions for MAS within the X shape
X_SHAPE_DIRECTIONS = [
  [[-1, -1], [1, 1]], # Top-left to bottom-right diagonal
  [[-1, 1], [1, -1]]  # Top-right to bottom-left diagonal
]

def count_x_mas_occurrences(grid)
  rows = grid.length
  cols = grid[0].length
  count = 0

  # Helper method to check if "MAS" exists in a specific direction
  def mas_exists?(grid, start_row, start_col, dir_row, dir_col)
    mas = "MAS"
    mas_reverse = mas.reverse
    mas.chars.each_with_index do |char, i|
      r = start_row + i * dir_row
      c = start_col + i * dir_col
      return false if r < 0 || r >= grid.length || c < 0 || c >= grid[0].length
      return false unless grid[r][c] == char || grid[r][c] == mas_reverse[i]
    end
    true
  end

  # Iterate through each cell in the grid to find X-MAS patterns
  (1...(rows - 1)).each do |row|
    (1...(cols - 1)).each do |col|
      # Check both diagonal directions for X-MAS
      X_SHAPE_DIRECTIONS.each do |(dir1, dir2)|
        if mas_exists?(grid, row, col, dir1[0], dir1[1]) &&
           mas_exists?(grid, row, col, dir2[0], dir2[1])
          count += 1
        end
      end
    end
  end

  count
end

# Count occurrences of X-MAS patterns
result = count_x_mas_occurrences(grid)
puts "Part 2: The X-MAS pattern appears #{result} times."
