// Copyright (c) 2017 The Olivingcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef OLIVINGCOIN_RPC_MINING_H
#define OLIVINGCOIN_RPC_MINING_H

#include <script/script.h>

#include <univalue.h>

/** Generate blocks (mine) */
UniValue generateBlocks(std::shared_ptr<CReserveScript> coinbaseScript, int nGenerate, uint64_t nMaxTries, bool keepScript);

#endif
