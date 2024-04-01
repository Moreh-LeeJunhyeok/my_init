SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo apt update
sudo apt install build-essential -y
conda init bash
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
zsh
sed -i "11s/.*/ZSH_THEME="xiong-chiamiov-plus"/g" ~/.zshrc && source ~/.zshrc
cat $SCRIPT_DIR/theme |& tee ~/.oh-my-zsh/themes/xiong-chiamiov-plus.zsh-theme && source ~/.zshrc
conda init zsh && source ~/.zshrc
echo "changeps1: false" |& tee ~/.condarc
conda activate moreh

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git config --global user.email "junhyeok.lee@moreh.io"
git config --global user.name "junhyeok.lee"

pip install -U -r $SCRIPT_DIR/requirements.txt
