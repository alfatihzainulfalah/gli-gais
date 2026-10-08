# CLAUDE.md

## Project UI / Design System Rules

This document defines the visual and implementation rules for the
application. Follow these rules consistently across every page,
component, screen, and feature.

------------------------------------------------------------------------

## 1. Core Design Direction

Build the application with a:

-   Modern
-   Professional
-   Clean
-   Lightweight
-   Production-ready
-   Mobile-first
-   Institutional / academic
-   Consistent

The interface must feel like a real production application for
**Institut Teknologi & Bisnis Bina Sarana Global**, not an experimental
or AI-generated template.

### Avoid

-   AI-slop visual patterns
-   Excessive gradients
-   Excessive glassmorphism
-   Random decorative elements
-   Excessive rounded cards
-   Too many shadows
-   Unnecessary animations
-   Oversized typography
-   Inconsistent spacing
-   Random colors
-   Purple as the primary brand color
-   Replacing the official logo with generated alternatives

Prioritize usability and visual hierarchy over decoration.

------------------------------------------------------------------------

## 2. Brand Identity

### Institution

**Institut Teknologi & Bisnis Bina Sarana Global**

### Logo

The provided original institutional logo is the official brand asset.

### Logo Rules

-   Always use the provided original logo.
-   Never redraw or recreate the logo.
-   Never simplify the logo.
-   Never replace it with an icon or generated logo.
-   Never distort the logo.
-   Preserve its original proportions.
-   Preserve the original red, blue, yellow/orange, and white elements.
-   Do not apply filters that change its brand colors.
-   Do not stretch the logo horizontally or vertically.
-   Maintain sufficient clear space around the logo.
-   On dark backgrounds, ensure the logo remains clearly visible.
-   Prefer the original logo in PNG/SVG format when available.

If a logo asset already exists in the project, reuse it instead of
creating a new one.

------------------------------------------------------------------------

## 3. Color System

Use the following palette consistently.

### Primary

``` text
Primary Navy:      #174A96
Dark Navy:         #12366F
Secondary Blue:    #2F6FD6
```

### Logo-Inspired Accent

``` text
Logo Red:          #ED1B2F
Logo Yellow:       #F9A825
```

Accent colors should support the interface and should not overpower the
primary navy branding.

### Neutral Colors

``` text
Background:        #F8FAFD
Surface:           #FFFFFF
Primary Text:      #172B4D
Secondary Text:    #718096
Muted Text:        #94A3B8
Border:            #E2E8F0
Input Background:  #FFFFFF
```

### Color Usage

-   Navy = primary actions, navigation, headers, important UI elements.
-   Dark navy = strong text and high-contrast areas.
-   Blue = secondary actions and active states.
-   Red = errors, destructive actions, or very limited branding accents.
-   Yellow/orange = small highlights or branding accents.
-   White = surfaces and forms.
-   Light blue/gray = subtle backgrounds and separators.

Do not introduce additional colors unless there is a clear functional
reason.

------------------------------------------------------------------------

## 4. Typography

Use a clean modern sans-serif font.

Preferred:

-   Inter
-   Poppins
-   Plus Jakarta Sans
-   System sans-serif fallback

Typography should have a clear hierarchy.

### Example

``` text
Page title:       28–32px / 700
Section title:    20–24px / 600–700
Body:             14–16px / 400
Label:            13–15px / 500–600
Placeholder:      14–16px / 400
Button:           13–15px / 600–700
```

Avoid unnecessarily large headings.

------------------------------------------------------------------------

## 5. Spacing

Use a consistent spacing system based on multiples of 4px.

Preferred values:

``` text
4px
8px
12px
16px
20px
24px
32px
40px
48px
64px
```

Do not use arbitrary spacing values unless required by the layout.

Maintain generous but practical spacing.

------------------------------------------------------------------------

## 6. Border Radius

Use moderate rounded corners.

Preferred:

``` text
Small controls:    8px
Inputs:            12px–14px
Cards:             16px
Large containers:  20px–24px
Pill buttons:      999px
```

Do not make every element excessively rounded.

------------------------------------------------------------------------

## 7. Shadows

Use subtle shadows only when they improve hierarchy.

Preferred style:

``` text
0 4px 16px rgba(15, 23, 42, 0.08)
```

Avoid strong floating shadows.

Inputs should generally use a subtle border with a light shadow rather
than a heavy elevation effect.

------------------------------------------------------------------------

## 8. Login Page

The login page should follow this structure:

``` text
┌─────────────────────────────┐
│                             │
│       NAVY HEADER           │
│                             │
│       ORIGINAL LOGO         │
│                             │
│   Institut Teknologi &      │
│   Bisnis Bina Sarana Global │
│                             │
│       Curved transition     │
├─────────────────────────────┤
│                             │
│          Login              │
│                             │
│  Silakan masuk untuk        │
│  melanjutkan ke sistem.     │
│                             │
│  Employee ID                │
│  ┌───────────────────────┐  │
│  │ 👤 Enter employee id  │  │
│  └───────────────────────┘  │
│                             │
│  Password                   │
│  ┌───────────────────────┐  │
│  │ 🔒 Enter password  👁 │  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │         LOGIN →       │  │
│  └───────────────────────┘  │
│                             │
│     Subtle footer graphic   │
│                             │
└─────────────────────────────┘
```

### Login Header

-   Use primary/dark navy.
-   Use subtle curved shapes.
-   Keep the header visually strong but not excessive.
-   Center the original institutional logo.
-   Logo should remain the primary visual identity.

### Login Form

Use:

-   White/light background
-   Clear labels
-   Comfortable input height
-   User icon for Employee ID
-   Lock icon for Password
-   Eye icon for password visibility
-   Large accessible login button

### Login Button

Use:

``` text
Background: #174A96
Text:       #FFFFFF
```

Optional hover/pressed state:

``` text
Hover:      #12366F
```

Button should be easy to tap on mobile.

------------------------------------------------------------------------

## 9. Inputs

Recommended:

``` text
Height:       56–60px
Radius:       12–14px
Border:       1px solid #E2E8F0
Background:   #FFFFFF
Padding:      16px
```

Focus state:

``` text
Border: #2F6FD6
```

Do not use overly bright focus effects.

Placeholder text should remain readable but visually secondary.

------------------------------------------------------------------------

## 10. Buttons

Primary button:

``` text
Background: #174A96
Text:       #FFFFFF
Radius:     999px
Height:     52–58px
Font:       600–700
```

Secondary button:

``` text
Background: #FFFFFF
Border:     1px solid #174A96
Text:       #174A96
```

All buttons must have clear hover, focus, disabled, and pressed states
when applicable.

------------------------------------------------------------------------

## 11. Icons

Use one icon library consistently.

Preferred:

-   Lucide
-   Material Symbols
-   Font Awesome

Do not mix multiple icon styles on the same screen.

Icons should generally use:

``` text
16px–22px
```

Avoid oversized decorative icons.

------------------------------------------------------------------------

## 12. Responsive Design

The application is **mobile-first**.

Primary target:

-   Mobile phones

Then support:

-   Tablets
-   Desktop

### Mobile

-   Full-width layout
-   Comfortable touch targets
-   Bottom navigation when appropriate
-   Avoid horizontal scrolling
-   Keep forms within safe screen margins

### Desktop

-   Use centered content containers.
-   Do not simply stretch the mobile layout across the entire screen.
-   Maintain reasonable maximum widths.

Suggested content widths:

``` text
Mobile:   100%
Tablet:   640–768px
Desktop:  960–1200px
```

------------------------------------------------------------------------

## 13. Layout Principles

Use:

-   Clear sections
-   Strong hierarchy
-   Consistent alignment
-   Predictable navigation
-   Adequate whitespace

Prefer:

``` text
Container
 ├── Header
 ├── Main content
 │    ├── Section
 │    ├── Cards / Forms
 │    └── Actions
 └── Footer / Navigation
```

Avoid deeply nested visual containers without purpose.

------------------------------------------------------------------------

## 14. Cards

Cards should be used when they help group related information.

Recommended:

``` text
Background: #FFFFFF
Border: 1px solid #E2E8F0
Radius: 16px
Shadow: subtle
Padding: 16–24px
```

Do not put every piece of content inside a card.

------------------------------------------------------------------------

## 15. Navigation

Navigation should be simple and predictable.

Active navigation:

``` text
Color: #174A96
```

Inactive navigation:

``` text
Color: #718096
```

Use consistent active states throughout the application.

------------------------------------------------------------------------

## 16. Forms

All forms must:

-   Have visible labels
-   Have meaningful placeholders
-   Use consistent field heights
-   Have clear validation messages
-   Preserve user input when validation fails
-   Clearly indicate required fields
-   Support keyboard navigation
-   Have accessible focus states

Error states should use the logo-inspired red only when necessary.

------------------------------------------------------------------------

## 17. Accessibility

Always consider:

-   Sufficient color contrast
-   Keyboard navigation
-   Visible focus states
-   Proper labels
-   Semantic HTML
-   Touch targets of at least approximately 44px
-   Readable text
-   Descriptive button labels

Do not communicate important information through color alone.

------------------------------------------------------------------------

## 18. Animation

Animations should be subtle and functional.

Preferred:

``` text
Duration: 150–250ms
Easing: ease-out
```

Use animation for:

-   Button feedback
-   Input focus
-   Navigation transitions
-   Modal appearance
-   Loading states

Avoid:

-   Large bouncing animations
-   Excessive parallax
-   Continuous decorative animations
-   Slow page transitions

------------------------------------------------------------------------

## 19. Component Consistency

Before creating a new component, check whether an existing component can
be reused.

Common reusable components:

``` text
Button
Input
PasswordInput
Card
Modal
Alert
Badge
Navbar
Header
BottomNavigation
Loading
EmptyState
```

Do not create duplicate components with slightly different styling.

If a visual pattern appears on multiple pages, make it reusable.

------------------------------------------------------------------------

## 20. Code Quality

Keep implementation:

-   Simple
-   Readable
-   Maintainable
-   Modular
-   Reusable
-   Lightweight

Avoid unnecessary dependencies.

Do not add a library simply to implement a small feature that can be
handled with existing project tools.

Keep business logic separate from presentation where practical.

------------------------------------------------------------------------

## 21. Responsive Validation

Every UI change should be considered at:

``` text
375px
390px
430px
768px
1024px
1280px+
```

Pay special attention to:

-   Text wrapping
-   Input widths
-   Button sizes
-   Logo proportions
-   Header height
-   Bottom navigation
-   Safe areas
-   Overflow

------------------------------------------------------------------------

## 22. Design Decision Priority

When making a design decision, follow this priority:

1.  Usability
2.  Consistency
3.  Accessibility
4.  Brand identity
5.  Performance
6.  Visual polish

Do not sacrifice usability just to make the interface visually
impressive.

------------------------------------------------------------------------

## 23. Before Implementing Any UI

Before writing code:

1.  Check the existing project structure.
2.  Check existing components.
3.  Check existing styles/design tokens.
4.  Reuse existing assets.
5.  Reuse the official logo.
6.  Follow this color system.
7.  Follow the spacing system.
8.  Check responsive behavior.
9.  Avoid unnecessary dependencies.
10. Keep the result consistent with the rest of the application.

------------------------------------------------------------------------

## 24. Final Quality Checklist

Before considering a page complete, verify:

-   [ ] Original institutional logo is used.
-   [ ] Logo proportions are preserved.
-   [ ] Primary color is navy/blue.
-   [ ] Purple is not used as the primary brand color.
-   [ ] Typography is consistent.
-   [ ] Spacing is consistent.
-   [ ] Inputs are consistent.
-   [ ] Buttons are consistent.
-   [ ] Icons use one visual style.
-   [ ] Mobile layout works correctly.
-   [ ] Desktop layout works correctly.
-   [ ] No unnecessary visual effects.
-   [ ] No excessive cards.
-   [ ] No excessive gradients.
-   [ ] No AI-slop visual patterns.
-   [ ] Accessibility basics are covered.
-   [ ] Existing components are reused where possible.
-   [ ] No unnecessary dependencies were introduced.
-   [ ] The final interface feels like a real production application.

------------------------------------------------------------------------

## 25. Important Instruction

**Consistency is more important than novelty.**

When a new page is requested, do not invent a completely different
visual style.

Extend the existing design system.

The application should look like one coherent product, not a collection
of unrelated UI templates.
