class ProposalMailerPreview < ActionMailer::Preview
  def notify_new_proposal
    ad = Ad.first
    owner = User.first
    owner = FactoryGirl.create(:user) if owner.nil?
    FactoryGirl.create(:profile, user: owner)
    FactoryGirl.create(:ad, user: owner) if ad.nil?
    ProposalMailer.notify_new_proposal(ad)
  end
end
