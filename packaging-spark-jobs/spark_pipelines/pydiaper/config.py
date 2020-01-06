import os
from pathlib import Path

DATA_LAKE = Path(os.environ.get("DATA_LAKE",
                                "/home/repl/workspace/mnt/data_lake"))
