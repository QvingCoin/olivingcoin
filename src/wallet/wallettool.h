// Copyright (c) 2016-2018 The Olivingcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef OLIVINGCOIN_WALLET_WALLETTOOL_H
#define OLIVINGCOIN_WALLET_WALLETTOOL_H

#include <script/ismine.h>
#include <wallet/wallet.h>

namespace WalletTool {

std::shared_ptr<CWallet> CreateWallet(const std::string& name, const fs::path& path);
std::shared_ptr<CWallet> LoadWallet(const std::string& name, const fs::path& path);
void WalletShowInfo(CWallet* wallet_instance);
bool ExecuteWalletToolFunc(const std::string& command, const std::string& file);

} // namespace WalletTool

#endif // OLIVINGCOIN_WALLET_WALLETTOOL_H
