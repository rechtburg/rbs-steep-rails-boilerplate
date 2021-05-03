# Steepfile

target :app do
  # 生成・手書きしたRBSファイルがあるディレクトリを指定する。
  signature 'sig'

  # 解析したいRubyコードがあるディレクトリを指定する
  check 'app'

  # 先程ダウンロードした gem_rbs 内の gems ディレクトリへのパスを指定する
  repo_path "gem_rbs/gems"

  # rbs gem, gem_rbs からrequireしたいライブラリ名を指定する。
  library 'pathname'
  library 'logger'
  library 'mutex_m'
  library 'date'

  library 'activesupport'
  library 'actionpack'
  library 'activejob'
  library 'activemodel'
  library 'actionview'
  library 'activerecord'
  library 'railties'
end
