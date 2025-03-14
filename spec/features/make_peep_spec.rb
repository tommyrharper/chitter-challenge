feature 'User can make add a peep' do
  scenario 'visits webpage and makes peep' do
    make_peep('1st peep')
    
    expect(page).to have_content '1st peep'
  end
end

feature 'User can see peeps in reverse chronological order' do
  scenario 'visits webpage, adds multiple peeps' do
    make_peep('1st peep')
    make_peep('2nd peep')
    make_peep('3rd peep')

    expect(page).to have_content '3rd peep'
    expect(page).to have_content '2nd peep'
    expect(page).to have_content '1st peep'
  end
end

feature 'User can see the time a and date a peep was made' do
  scenario 'when adding a new peep' do
    p "sometimes this test fails by a second due to lag"
    make_peep('timed peep')
    
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    expect(page).to have_content("timed peep - #{time}")
  end
end

feature 'User can see who made a peep - name and username' do
  scenario 'after making some peeps' do
    visit('/')
    sign_up
    make_peep('1st peep')
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    click_button('Sign out')
    sign_up('newemail@me.com', 'newusername', 'newname')
    make_peep('2nd peep')
    time2 = Time.now.strftime('%Y-%m-%d %H:%M:%S')

    expect(page).to have_content("2nd peep - #{time2} - newname - newusername")
    expect(page).to have_content("1st peep - #{time} - testname - testusername")

  end
end
