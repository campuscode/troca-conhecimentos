class ProposalMailerPreview < ActionMailer::Preview
  def notify_new_proposal
    ad = Ad.first
    owner = User.first
    owner = FactoryGirl.create(:user) if owner.nil?
    FactoryGirl.create(:profile, user: owner)
    FactoryGirl.create(:ad, user: owner) if ad.nil?
    ProposalMailer.notify_new_proposal(ad)
  end

  def notify_proposal_accepted
    ad = Ad.first
    owner = User.first
    owner = FactoryGirl.create(:user) if owner.nil?
    proposal = FactoryGirl.create(:proposal, user: owner, ad: ad)
    FactoryGirl.create(:profile, user: owner)
    FactoryGirl.create(:ad, user: owner) if ad.nil?

    ProposalMailer.notify_proposal_accepted(proposal)
  end
end
