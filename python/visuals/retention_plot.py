import matplotlib.pyplot as plt

# Retention data (onboarding cohort)
days = ["Day 1", "Day 3", "Day 7"]
retention_rate = [0.085, 0.028, 0.008]

fig, ax = plt.subplots(figsize=(8, 4))

ax.plot(days, retention_rate, marker="o")
ax.set_ylim(0, 0.1)
ax.set_ylabel("Retention Rate")
ax.set_title("Onboarding Cohort Retention (D1 / D3 / D7)")

# Annotate points
for i, value in enumerate(retention_rate):
    ax.text(i, value + 0.004, f"{value*100:.1f}%", ha="center")

fig.tight_layout()
fig.savefig("onboarding_retention_d1_d3_d7.png", dpi=150)

plt.show()
