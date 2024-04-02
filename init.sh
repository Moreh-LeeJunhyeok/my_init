SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# install packages
sudo apt update
sudo apt install build-essential -y
apt install tmux -y
apt-get install locales
locale-gen en_US.UTF-8

# install zsh
conda init bash
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
zsh
sed -i "11s/.*/ZSH_THEME="xiong-chiamiov-plus"/g" ~/.zshrc && source ~/.zshrc
cat $SCRIPT_DIR/theme |& tee ~/.oh-my-zsh/themes/xiong-chiamiov-plus.zsh-theme && source ~/.zshrc
conda init zsh && source ~/.zshrc
echo "changeps1: false" |& tee ~/.condarc
conda activate moreh

# install and set git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git config --global user.email "junhyeok.lee@moreh.io"
git config --global user.name "junhyeok.lee"

# install important python packages
pip install -U -r $SCRIPT_DIR/requirements.txt

# install moreh packages
cd ~/
conda activate moreh
mkdir repos&& cd repos
git clone https://github.com/moreh-dev/large-models.git
git clone https://github.com/moreh-dev/moreh-datasets.git

cd ~/repos/large-models && git lfs install && pip install -e .
cd ~/repos/moreh-datasets && git lfs install && make install

# re-install moai
update-moreh

# remove cache
rm -rf ~/.cache/pip