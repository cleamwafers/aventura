class SearchesController < ApplicationController
  def search
    # splitで正規表現を使ってキーワードを空白(全角・半角・連続)分割する
    #   連続した空白も除去するので、最後の“+”がポイント
    @keywords = params[:keywords].split(/[[:blank:]]+/)

    # 空のモデルオブジェクト作成（何も入っていない空配列のようなもの）
    @results = Sanctuary.none

    # -----------
    # AND検索
    # -----------
    @keywords.each_with_index do |keyword, i|
      # 1回目のループでは、1つ目のワードで検索
      #   結果を@resultsに詰め込む
      @results = Sanctuary.search(keyword) if i == 0

      # 2回目以降のループでは、1回目の結果を更にモデル定義の検索メソッドで絞り込みしていく
      #   結果を@resultsに詰め込む
      @results = @results.merge(@results.search(keyword), rewhere: true) if i != 0
    end
  end
end
