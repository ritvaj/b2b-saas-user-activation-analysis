import matplotlib.pyplot as plt

# Data (from analysis)
steps = [
    "Onboarding → Feature Discovery",
    "Feature Discovery → Activation"
]

median_time_sec = [74, 727]

plt.figure(figsize=(8, 4))

plt.bar(steps, median_time_sec, color='#008080', label='Teal by Hex Code')

plt.ylabel("Median Time (seconds)")
plt.title("Median Time Between Funnel Steps")

# Annotating bars
for i, value in enumerate(median_time_sec):
    plt.text(i, value + 10, f"{value}s", ha="center")

plt.tight_layout()


# Saving figure
plt.savefig("median_time_to_next_step.png", dpi=150, bbox_inches="tight")
print('saved')

plt.show()
