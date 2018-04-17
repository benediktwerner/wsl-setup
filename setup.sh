echo "Silencing bell ..."
echo 'set bell-style none' >> ~/.inputrc

echo "Installing git ..."
add-apt-repository ppa:git-core/ppa
apt update
apt install git

echo "Copying dotfiles ..."
cp dotfiles/* ~/

echo "Adding to .bashrc ..."
cat .bashrc >> ~/.bashrc


echo
echo "TODO:"
echo "- Configure git"
echo "  - Set name, email and gpg-key"
echo "  - Set line ending behaviour"
echo "  - Set gpgsing to true"
echo
echo "- Comment out the 'HISTSIZE=..' and 'HISTFILESIZE=..' lines in the .bashrc file"

