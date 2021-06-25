// Copyright (c) 2011-2014 The Olivingcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef OLIVINGCOIN_QT_OLIVINGCOINADDRESSVALIDATOR_H
#define OLIVINGCOIN_QT_OLIVINGCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class OlivingcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit OlivingcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Olivingcoin address widget validator, checks for a valid olivingcoin address.
 */
class OlivingcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit OlivingcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // OLIVINGCOIN_QT_OLIVINGCOINADDRESSVALIDATOR_H
