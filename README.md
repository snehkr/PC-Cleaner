# 🧹 PC Cleaner & Optimizer - Ultimate Edition

**Author:** SNEH KR  
**Type:** Windows Batch Script (`.bat`)  
**Version:** Ultimate Edition

---

## 📌 Overview

The **PC Cleaner & Optimizer - Ultimate Edition** is an all-in-one batch script designed to keep your Windows system clean, optimized, and running smoothly.  
It provides a menu-driven interface with safe cleaning options, repair tools, and performance optimizations — all without requiring third-party software.

---

## ✨ Features

### 🧼 Cleaning

- **Temporary Files Cleanup** → Deletes Windows & User temp files.
- **Logs & Junk Files Cleanup (Safe)** → Cleans unnecessary logs safely.
- **Browser Cache Cleanup** → Clears Chrome, Edge, and Firefox caches.
- **Windows Update Cache Cleanup** → Frees up space by removing update leftovers.
- **Recycle Bin Cleanup** → Empties Recycle Bin completely.
- **Windows Disk Cleanup** → Runs built-in cleanup utility with all items preselected.

### ⚡ Optimization & Repair

- **Flush DNS & Reset Network** → Resets network configurations.
- **RAM Info (Educational)** → Informs about RAM cleanup and tools.
- **Disk Check (chkdsk)** → Schedules disk repair on reboot.
- **Defrag/Trim Optimization** → Defrags HDD or TRIMs SSD automatically.
- **Repair System Files** → Runs SFC & DISM scans to fix system corruption.
- **Power Plan Optimization** → Sets system to High Performance or Ultimate Performance.

### 🖥️ System Info & Advanced

- **View Startup Programs** → Lists programs that run at startup.
- **System Health Info** → Shows CPU, RAM, and Disk usage.
- **Clear Event Logs (Advanced)** → Clears all system event logs (warning: permanent).

### 🚀 All-in-One Mode

- Runs all essential cleaning & optimization tasks in one go.

---

## 📖 Usage

1. **Run as Administrator**  
   Right-click the batch file → `Run as Administrator`.  
   (The script requires admin rights for full functionality.)

2. **Navigate the Menu**
   - Enter a number (`1–17`) to perform the corresponding task.
   - Use option **12** for **Full Cleanup + Optimization**.
   - Use option **17** to exit.

---

## ⚠️ Warnings

- Some features (e.g., **Event Log Clearing**) are **irreversible**. Use carefully.
- RAM optimization is **informational only** (safe execution).
- Defrag runs only if HDD is detected; SSDs use TRIM instead.

---

## 🛠️ Requirements

- Windows 7, 8, 10, 11 (Admin rights required).
- Works best on Windows 10/11 with PowerShell support.

---

## 📷 Screenshot (Sample)

```
==================================================
    WELCOME TO PC CLEANER & OPTIMIZER
          Made by: SNEH KR
==================================================

 --- CLEANING ---
 1. Clean Temporary Files
 2. Clean Logs & Junk Files (Safe)
 3. Clean Browser Caches
 4. Clean Windows Update Cache
 5. Empty Recycle Bin
 13. Run Windows Disk Cleanup (Recommended)

 --- OPTIMIZATION & REPAIR ---
 6. Flush DNS & Reset Network
 7. Optimize RAM (Info Only)
 8. Run Disk Check (chkdsk)
 9. Defragment HDD / Optimize SSD (TRIM)
 14. Repair System Files (SFC & DISM)
 15. Set Power Plan to High Performance

 --- SYSTEM INFO & ADVANCED ---
 10. Show Startup Programs
 11. Show System Health Info
 16. Clear All Windows Event Logs (Advanced)

 --- ALL-IN-ONE ---
 12. Run Full Cleanup + Optimization

 99. Exit
==================================================
```

---

## 📜 License

This project is open-source. Free to use and modify with credit to [SNEH KR](https://github.com/snehkr).

---

### 💡 Tip:

Schedule this batch file to run weekly using Windows Task Scheduler for **automatic PC maintenance**.
