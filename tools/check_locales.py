#!/usr/bin/env python3
"""Locale key-parity and enUS-identical-value checker for SQP_Classic.

Parses each locales/<locale>.lua module's L["KEY"] = "value" assignments and
compares against the enUS baseline:
  - key parity: every module must contain exactly the enUS key set (0 missing, 0 extra)
  - identical count: how many values are byte-identical to enUS, listed by key

Usage: python3 tools/check_locales.py [--identical]  (from repo root)
"""
import re
import sys
from pathlib import Path

ASSIGN_RE = re.compile(r'(?:^L|\[)\s*"?([A-Z0-9_]+)"?\s*\]?\s*=\s*"((?:[^"\\]|\\.)*)"')


def unescape(s):
    return s.replace('\\"', '"').replace("\\\\", "\\").replace("\\n", "\n")


def parse_module(path):
    """Parse both enUS table-constructor syntax (["KEY"] = "value") and the
    override-assignment syntax (L["KEY"] = "value")."""
    text = Path(path).read_text(encoding="utf-8")
    out = {}
    for k, v in ASSIGN_RE.findall(text):
        if k in ("KEY", "k", "v"):  # generic pattern guard
            continue
        out[k] = unescape(v)
    return out


def main():
    root = Path(__file__).resolve().parent.parent
    locales = root / "locales"
    enus = parse_module(locales / "enUS.lua")
    print(f"enUS baseline keys: {len(enus)}")

    failures = []
    modules = sorted(p.stem for p in locales.glob("*.lua") if p.stem != "enUS")
    for name in modules:
        vals = parse_module(locales / f"{name}.lua")
        missing = sorted(set(enus) - set(vals))
        extra = sorted(set(vals) - set(enus))
        identical = sorted(k for k in enus if k in vals and vals[k] == enus[k])
        status = "OK" if not missing and not extra else "FAIL"
        print(f"{name}: keys={len(vals)} missing={len(missing)} extra={len(extra)} "
              f"identical_to_enUS={len(identical)} [{status}]")
        if missing:
            print(f"  missing: {missing}")
        if extra:
            print(f"  extra: {extra}")
        if "--identical" in sys.argv or "-v" in sys.argv:
            for k in identical:
                print(f"  == {k}")
        if missing or extra:
            failures.append(name)

    if failures:
        print(f"RESULT: FAIL ({', '.join(failures)})")
        return 1
    print("RESULT: PASS (all modules at full key parity with enUS)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
