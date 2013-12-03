class Repair < ActiveRecord::Base

  # validation
  
  # Association
  belongs_to :engine
  
  # 作業中かどうかを判定する
  def opened?
    return self.finish_date.nil?
  end

  # 現時点での発行Noの生成(年月-枝番3桁)
  def self.createIssueNo
    issuedate = Date.today.strftime("%Y%m") 
    return issuedate + "-" + 
           sprintf("%03d", self.where("issue_no like ?", issuedate + "%").max() + 1 )
  end
  
end
