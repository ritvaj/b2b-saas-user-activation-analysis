import matplotlib.pyplot as plt

# A/B conversion data
variants = ["Variant A", "Variant B"]
conversion_rates = [0.049, 0.0404]

colors = ["#4C72B0", "#DD8452"]  # blue, orange

fig, ax = plt.subplots(figsize=(6, 3))

# Horizontal bars
ax.barh(variants, conversion_rates, color=colors)

# Axis limits and labels
ax.set_xlim(0, 0.055)
ax.set_xlabel("Activation Conversion Rate")
ax.set_title("A/B Test — Activation Conversion Comparison")

# Annotate bars with percentages
for i, value in enumerate(conversion_rates):
    ax.text(value + 0.001, i, f"{value*100:.2f}%", va="center")

# Optional subtle grid (x-axis only)
ax.xaxis.grid(True, linestyle="--", alpha=0.3)

# Clean up spines
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

# Layout and save
fig.tight_layout()
fig.savefig("ab_activation_horizontal_bar.png", dpi=150)

plt.show()
