# ETHminerWatchDogDmW

[![Hits](https://hits.sh/github.com/DeadManWalkingTO/ETHminerWatchDogDmW.svg?style=plastic&label=HitCount)](../../)
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../releases/latest)
[![GitHub top language](https://img.shields.io/github/languages/top/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../)
[![GitHub language count](https://img.shields.io/github/languages/count/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../)

[![GitHub last commit](https://img.shields.io/github/last-commit/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../)
[![Github commits (since latest release)](https://img.shields.io/github/commits-since/DeadManWalkingTO/ETHminerWatchDogDmW/latest.svg)](../../)
[![GitHub stars](https://img.shields.io/github/stars/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../stargazers)
[![GitHub forks](https://img.shields.io/github/forks/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../network)
[![GitHub issues](https://img.shields.io/github/issues/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](../../issues)

[![DMCA Protection](https://img.shields.io/badge/DMCA-Protected-brightgreen.svg)](https://www.dmca.com/Takedowns.aspx?r=m)
[![GitHub license](https://img.shields.io/github/license/DeadManWalkingTO/ETHminerWatchDogDmW.svg)](./LICENSE)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)](./README.md)

> [ETHminer](https://github.com/ethereum-mining/ethminer) WatchDog by [DeadManWalking (DeadManWalkingTO-GitHub)](https://github.com/DeadManWalkingTO)

ETHminerWatchDogDmW is a simple script (Windows/Linux) WachDog for [ETHminer](https://github.com/ethereum-mining/ethminer).

- Supported Operating System
  - Windows (All versions)
    - Windows (7 / 8 / 10)
    - Windows Server (2008 / 2012 / 2016 / 2019)
  - Linux
    - Any Distribution
    - Any Version
  - Unix
    - Any Distribution and Version compatible with BASH
  
- Supported Architectures:
  - x86
  - x64
  
## Table of Contents

- [Features](#features)
- [Download](#download)
- [Install](#install)
- [Usage](#usage)
- [Feedback](#feedback)
- [Maintainers](#maintainers)
- [Contribute](#contribute)
- [License](#license)
- [Donations](#donations)
- [Common Issues](#common-issues)

## Features

Simple script (Windows/Linux) WachDog for [ETHminer](https://github.com/ethereum-mining/ethminer).

ETHminerWatchDogDmW:

1. Run ethminer
2. Restart ethminer up to 10 times
3. Reboot the system

* CUDA support removed because ethminer added `--exit` parameter to exit whenever an error occurred! ([#757] P.R.)
* AutoFix [#189](https://github.com/ethereum-mining/ethminer/issues/189) issue of Ethminer.
* AutoFix [#385](https://github.com/ethereum-mining/ethminer/issues/385) issue of Ethminer.
* Log file `RunTimes.log`.
* Auto Turn off the Error Dialog (Windows).
* On all systems, it is necessary for the user to have reboot permissions.
  * Οn Linux systems create a file `/etc/sudoers.d/reboot` with `username ALL=NOPASSWD:/sbin/reboot`

## Download

Download [Last release here.](../../releases/latest)

## Install

Script (No installation required)

## Usage

* Download or Clone
* Unzip
* Copy ETHminerWatchDogDmW.bat (Windows) or ETHminerWatchDogDmW.sh (Linux) to ETHminer folder.
* Modify the code between:
  * `==================== Your Code Starts Here ====================`
  * `==================== Your Code Ends Here ====================`
* Run the script.

## Feedback

Please inform me for additional improvements; [open an issue](../../issues).

If you like please give a [GitHub Star](../../stargazers) (it's free!).

## Maintainers

[DeadManWalking (DeadManWalkingTO-GitHub)](https://github.com/DeadManWalkingTO).

## Contribute

Feel free to open an [Issue](../../issues/new) or submit [Pull Requests](../../pulls).

## License

[MIT © DeadManWalking (DeadManWalkingTO-GitHub)](./LICENSE).

## Donations

If you find this useful please donate something at the following:

Bitcoin Address (BTC):
* bc1qcsh3zxlrmfmeyz38j7uzk8z2g2qtuctdtttttp

Ethereum Address (ETH):
* 0x5c9D5F4fC058726c2Fe76463FB21DDdfCff0bc44

Monero Address (XMR):
* 42q4HmXdsp1XgNCrDmPubL8ndtgG2JBtmZMEn28sB4XtEGHhwYojvB65HXPidByfNUFSzxg6ysQsHUHa3ZSrsKLX5pTkCET

Aeon Address (AEON):
* WmssXd9iiPCjjhfVyqYvPzhBuPKkZ5wkVXP5q8L7aYxfPJG5Z8nLyLJXUzxMeuvna9dCEBAmqBzCRWezF6AQqUS51EDJtjAYL

## Common Issues

#### How can i edit the bat:
Issue [#4](../../issues/4) | Status: **Solved**.
#### How to kill the process:
Issue [#7](../../issues/7) | Status: **Solved**.
#### On most systems shutdown or reboot needs sudo:
Issue [#11](../../issues/11) | Status: **Solved**.
#### ETHminerWatchDogDmW works both CUDA and AMD GPUs:
Issue [#13](../../issues/13) | Status: **Solved**.
#### Warning: -S is deprecated. Use the -P parameter instead:
Issue [#14](../../issues/14) | Status: **Solved**.
